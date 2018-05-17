package outwatch.dom.helpers;
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
        var childReceivers:Observable<Array<VNode>> = null;
        var adjustedAttrs = VDomProxy.attrsToSnabbDom(attributes);
        if (childrenStreamReceivers != null&&childrenStreamReceivers.length>0) {

            //    public var childrenStream:Observable<Array<VNode>>;
            childReceivers = new CombineLatest( childrenStreamReceivers.map(function(o:ChildrenStreamReceiver) return o.childrenStream), function(c:Array<Array<VNode>>) {
                var t:Array<VNode> = [];
                for (cc in c) {
                    t = t.concat(cc);
                }
                return t;
            });
        } else {
            childReceivers = new CombineLatest(
            childStreamReceivers.map(function(o:ChildStreamReceiver) return o.childStream), function(c:Array<VNode>) return c);

        }


        var attributeReceivers:Observable<Array<Attribute>> = new CombineLatest(
            attributeStreamReceivers.map(function(o:AttributeStreamReceiver) return o.attributeStream), function(c:Array<Attribute>) return c);



        var dataObject:VirtualNodeData =
        if (childStreamReceivers != null || attributeStreamReceivers != null || childrenStreamReceivers != null) {
            createReceiverDataObject(childReceivers, attributeReceivers, attributeStreamReceivers, adjustedAttrs, eventHandlers);
        } else {
            DataObject.createDataObject(adjustedAttrs, eventHandlers);
        }

        return new VTree(nodeType, children, dataObject);
    }

    static public function createReceiverDataObject(childReceivers:Observable<Array<VNode>> ,
                                                    attributeReceivers:Observable<Array<Attribute>>,
                                                    attributeStream:Array<AttributeStreamReceiver>,
                                                    attrs,
                                                    eventHandlers) {
        var subscriptionPromise:Observable<ISubscription> = Observable.empty();
        var insertHook = createInsertHook(childReceivers,attributeReceivers, subscriptionPromise);
        var deleteHook = createDestoryHook(subscriptionPromise);

        var dataObject:VirtualNodeData =
        if (Lambda.exists(attributeStream, function(a:AttributeStreamReceiver)return a.attribute == "value")) {
            DataObject.createWithValue(attrs, eventHandlers, insertHook, deleteHook);
        } else {
            DataObject.createWithHooks(attrs, eventHandlers, insertHook, deleteHook);
        }
        return dataObject;
    }


    static public function createInsertHook(childReceivers:Observable<Array<VNode>> ,
                                            attributeReceivers:Observable<Array<Attribute>>,
                                            subscriptionPromise:Observable<ISubscription>) {

        return function(proxy:VNodeProxy) {
            var subscription = childReceivers
            .map(function(changable:Array<VNode>) {
                var updatedNodeObj  = DataObject.updateChildrens(proxy.children, changable);
                return PatchDom.vnode(proxy.sel, proxy.data, updatedNodeObj);
            })
            .observer(function(tuple:VNodeProxy) {
                trace("createInsertHook childReceivers",proxy, tuple);
                PatchDom.patch(proxy, tuple);
            });
            var subscription2 = attributeReceivers
            .map(function(changable:Array<Attribute>) {
                var updatedObj = DataObject.updateAttributes(proxy.data, VDomProxy.attrsToSnabbDom(changable));
                return PatchDom.vnode(proxy.sel, updatedObj, proxy.children);
            })
            .observer(function(tuple:VNodeProxy) {
                trace("createInsertHook attributeReceivers");
                PatchDom.patchDom(proxy.elm, tuple);
            });
            subscriptionPromise.last(Binary.create(subscription,subscription2));
        }

    }


    static public function createDestoryHook(subscriptionPromise:Observable<ISubscription>) {
        return function(proxy:VNodeProxy) {
            var ss:ISubscription = subscriptionPromise.observer(function(s:ISubscription) {
                s.unsubscribe();
            });
            ss.unsubscribe();

        }
    }


    static public function seperateModifiers(args:Array<VDomModifier>) {
        var __seperateModifiers:SeperateModifiers = {
            emitters:cast args.filter(function(a)return Std.is(a, Emitter)),
            childReceivers:cast args.filter(function(a)return Std.is(a, ChildStreamReceiver)),
            childrenReceivers:cast args.filter(function(a)return Std.is(a, ChildrenStreamReceiver)),
            attributes:cast args.filter(function(a)return Std.is(a, Attribute)),
            attributeReceivers:cast args.filter(function(a)return Std.is(a, AttributeStreamReceiver)),
            children:cast args.filter(function(a)return Std.is(a, VNode))
        }
        return __seperateModifiers;

    }


}
