package outwatch.dom.helpers;
import outwatch.dom.DataObject;
import rx.disposables.Composite;
import rx.disposables.Binary;
import snabbdom.dom.VirtualNodeDom;
import snabbdom.dom.NativeNode;
import snabbdom.VirtualNodes;
import rx.observables.CombineLatest;
import snabbdom.VirtualNodeData;
import snabbdom.dom.PatchDom;
import rx.disposables.ISubscription;
import rx.Observable;
using rx.Observable;
import outwatch.dom.VDomModifier.Emitter;
import outwatch.dom.VDomModifier.ChildStreamReceiver;
import outwatch.dom.VDomModifier.ChildrenStreamReceiver;
import outwatch.dom.VDomModifier.Attribute;
import outwatch.dom.VDomModifier.AttributeStreamReceiver;
import outwatch.dom.VDomModifier.VNode;
import outwatch.dom.VDomModifier.VTree;
import outwatch.dom.VDomModifier.Pair;
import snabbdom.dom.VirtualNodeDom as VNodeProxy;
typedef SeperateModifiers = {
    var emitters:Array<Emitter<Any>>;
    var childReceivers:Array<ChildStreamReceiver>;
    var childrenReceivers:Array<ChildrenStreamReceiver>;
    var attributes:Array<Attribute>;
    var attributeReceivers:Array<AttributeStreamReceiver>;
    var children:Array<VNode>;
}
class DomUtils {
    static public function hyperscriptHelper(nodeType:String, args:Array<VDomModifier>):VNode {


        var sm:SeperateModifiers = seperateModifiers(args);

        return constructVNode(nodeType, sm.emitters, sm.childReceivers, sm.childrenReceivers, sm.attributes, sm.attributeReceivers, sm.children);

    }

    static public function constructVNode(nodeType:String,
                                          eventEmitters:Array<Emitter<Any>>,
                                          childStreamReceivers:Array<ChildStreamReceiver>,
                                          childrenStreamReceivers:Array<ChildrenStreamReceiver>,
                                          attributes:Array<Attribute>,
                                          attributeStreamReceivers:Array<AttributeStreamReceiver>,
                                          children:Array<VNode>):VNode {

        var eventHandlers = VDomProxy.emittersToSnabbDom(eventEmitters);

        var adjustedAttrs = VDomProxy.attrsToSnabbDom(attributes);



        var attributeReceivers:Observable<Array<Attribute>> = new CombineLatest(
            attributeStreamReceivers.map(function(o:AttributeStreamReceiver) return o.attributeStream), function(c:Array<Attribute>) return c);



        var dataObject:VirtualNodeData =
        if (childStreamReceivers != null || attributeStreamReceivers != null || childrenStreamReceivers != null) {
            createReceiverDataObject(childStreamReceivers,childrenStreamReceivers, attributeReceivers, attributeStreamReceivers, adjustedAttrs, eventHandlers);
        } else {
            DataObject.createDataObject(adjustedAttrs, eventHandlers);
        }

        return new VTree(nodeType, children, dataObject);
    }

    static public function createReceiverDataObject(  childStreamReceivers:Array<ChildStreamReceiver>,
                                                      childrenStreamReceivers:Array<ChildrenStreamReceiver>,
                                                    attributeReceivers:Observable<Array<Attribute>>,
                                                    attributeStream:Array<AttributeStreamReceiver>,
                                                    attrs,
                                                    eventHandlers) {
        var subscriptionPromise:Composite=Composite.create([]);
        var insertHook = createInsertHook(childStreamReceivers,childrenStreamReceivers,attributeReceivers, subscriptionPromise);
        var deleteHook = createDestoryHook(subscriptionPromise);

        var dataObject:VirtualNodeData =
        if (Lambda.exists(attributeStream, function(a:AttributeStreamReceiver)return a.attribute == "value")) {
            DataObject.createWithValue(attrs, eventHandlers, insertHook, deleteHook);
        } else {
            DataObject.createWithHooks(attrs, eventHandlers, insertHook, deleteHook);
        }
        return dataObject;
    }


    static public function createInsertHook(  childStreamReceivers:Array<ChildStreamReceiver>,
                                              childrenStreamReceivers:Array<ChildrenStreamReceiver>,
                                            attributeReceivers:Observable<Array<Attribute>>,
                                            subscriptionPromise:Composite) {

        return function(proxy:VNodeProxy) {
            subscriptionPromise.clear();
            var composite=subscriptionPromise;
            if (childrenStreamReceivers != null&&childrenStreamReceivers.length>0) {
                for(cr in childrenStreamReceivers){
                    var s=cr.childrenStream.map(function(changable:Array<VNode>) {
                        return PatchDom.vnode(cr.asProxy.sel,  cr.asProxy.data, DataObject.updateChildrens(changable));
                    }).observer(function(tuple:VNodeProxy){
                        PatchDom.patch(cr.asProxy, tuple);
                        cr.asProxy=tuple;
                    });
                    composite.add(s);
                }
            } else {
                for(c in childStreamReceivers){
                    var s= c.childStream.map(function(changable:VNode) {
                        return PatchDom.vnode(c.asProxy.sel,  c.asProxy.data,  DataObject.updateChildrens([changable]));
                    })
                    .observer(function(tuple:VNodeProxy){
                        PatchDom.patch(c.asProxy, tuple);
                        c.asProxy=tuple;
                    });
                    composite.add(s);
                }
            }

            var subscription2 = attributeReceivers
            .map(function(changable:Array<Attribute>) {
                var updatedObj = DataObject.updateAttributes(proxy.data, VDomProxy.attrsToSnabbDom(changable));
                return PatchDom.vnode(proxy.sel, updatedObj, proxy.children);
            })
            .observer(function(tuple:VNodeProxy) {
                trace("createInsertHook attributeReceivers");
                PatchDom.patch(proxy, tuple);
            });
            composite.add(subscription2);

        }

    }


    static public function createDestoryHook(subscriptionPromise:Composite) {
        return function(proxy:VNodeProxy) {

            subscriptionPromise.unsubscribe();

        }
    }


    static public function seperateModifiers(args:Array<VDomModifier>) {
        var __seperateModifiers:SeperateModifiers = {
            emitters:cast args.filter(function(a)return Reflect.hasField(a, "eventType")),
            childReceivers:cast args.filter(function(a)return Std.is(a, ChildStreamReceiver)),
            childrenReceivers:cast args.filter(function(a)return Std.is(a, ChildrenStreamReceiver)),
            attributes:cast args.filter(function(a)return Std.is(a, Attribute)),
            attributeReceivers:cast args.filter(function(a)return Std.is(a, AttributeStreamReceiver)),
            children:cast args.filter(function(a)return Std.is(a, VNode)  ||  Std.is(a, ChildStreamReceiver) ||  Std.is(a, ChildrenStreamReceiver))
        }
        return __seperateModifiers;

    }


}
