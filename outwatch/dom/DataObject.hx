package outwatch.dom;
import outwatch.dom.VDomModifier.VNode;
import snabbdom.dom.VirtualNodeDom;
import snabbdom.VirtualNodes;
import js.html.Element;
import js.html.InputElement;
import snabbdom.dom.Hooks.HookApi;
import snabbdom.dom.PatchDom;
import snabbdom.VirtualNodeData;
import snabbdom.dom.VirtualNodeDom as VNodeProxy;

class DataObject {

    public static function createDataObject(adjustedAttrs, eventHandlers): VirtualNodeData  {

        return    {
        attrs:adjustedAttrs,
        props:{},
        classes:{},
        style:{},
        on:eventHandlers,
        hook:null,
        skip_styles:true,
        skip_attributes:false,
        key:null,
        ns:null
        };
    }

    public static function createWithValue(attrs, eventHandlers, insertHook, deleteHook): VirtualNodeData  {
        var _hook=new HookApi();
        _hook.insert=insertHook;
        _hook.destroy=deleteHook;
        _hook.update=updateHook;
        return  {
            attrs:attrs,
            props:{},
            classes:{},
            style:{},
            on:eventHandlers,
            hook:_hook ,
            skip_styles:true,
            skip_attributes:false,
            key:null,
            ns:null
        };
    }
    public static function updateHook(old: VNodeProxy, node: VNodeProxy) {
       var elm:Element=node.elm;
       for( i in 0...  elm.children.length){
           if(Std.is(elm.children.item(i),InputElement)){
               var input:InputElement=cast elm.children.item(i);
               if (input.value != input.getAttribute("value")) {
                   input.value = input.getAttribute("value");
               }
           }
       }
    }

    public static function createWithHooks(attrs, eventHandlers, insertHook, deleteHook): VirtualNodeData  {
        var _hook=new HookApi();
        _hook.insert=insertHook;
        _hook.destroy=deleteHook;
        return  {
            attrs:attrs,
            props:{},
            classes:{},
            style:{},
            on:eventHandlers,
            hook:_hook ,
            skip_styles:true,
            skip_attributes:false,
            key:null,
            ns:null
        };
    }

    public static function updateAttributes(data:VirtualNodeData, attrs) {

        var newProps = data.attrs.clone();  //clone
        for(attrTitle in  Reflect.fields(attrs)){
            Reflect.setField(   newProps, attrTitle, Reflect.field(attrs,attrTitle));
        }
        return  {
        attrs:attrs,
        props:data.props,
        classes:data.classes,
        style:data.style,
        on:data.on,
        hook:data.hook ,
        skip_styles:data.skip_styles,
        skip_attributes:data.skip_attributes,
        key:data.key,
        ns:data.ns
        };
    }

    public static function updateChildrens(childrens , childrens2 :Array<VNode>)  {
        var childProxies:Array<VNodeProxy> = childrens2.map(function(c:VNode) return c.asProxy);
        return childProxies;
    }


}
