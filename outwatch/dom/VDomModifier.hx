package outwatch.dom;
import js.html.MouseEvent;
import js.html.InputEvent;
import js.html.KeyboardEvent;
import js.html.Event;
import rx.Subject;
import Array;
import snabbdom.VirtualNodeData;
import rx.Observable;
import snabbdom.dom.VirtualNodeDom as VNodeProxy;
class Pair<A, B> {
    public var _1:A;
    public var _2:B;

    public function new(_1, _2):Void {
        this._1 = _1;
        this._2 = _2;
    }
}
class VNode extends VDomModifier {
    public var asProxy:VNodeProxy;
}
class VTree extends VNode {
    public var nodeType:String;
    public var children:Array<VNode>;
    public var attributeObject:VirtualNodeData;

    public function new(nodeType:String,
                        children:Array<VNode>,
                        attributeObject:VirtualNodeData ) {
        super();
        var childProxies:Array<VNodeProxy> = children.map(function(c:VNode) return c.asProxy);

        asProxy = {
            sel:nodeType,
            data: attributeObject,
            children:childProxies,
            text:"",
            elm:null
        }
    }
}

class VDomModifier   {
    public function new() {

    }


}

class StringNode extends VNode {
    public function new(v:String) {
        super();
        asProxy ={
            sel:"span",
            data:DataObject.createDataObject({},{}),
            children:null,
            text:v,
            elm:null
        }
    }
}
class Emitter<T> extends VDomModifier {
    public var eventType:String;
    public var sink:Subject<T>;

    public function new(eventType:String, ?sink:Subject<T>) {
        super();
        this.eventType = eventType;
        this.sink = sink;
    }
}


typedef EventEmitter = Emitter<Event>;
typedef InputEventEmitter = Emitter<InputEvent>;
typedef MouseEventEmitter = Emitter<MouseEvent>;
typedef KeyEventEmitter = Emitter<KeyboardEvent>;


class GenericEmitter<T> extends Emitter<T> {
    public var t:T;

    public function new(eventType:String, sink:Subject<T>, t:T) {
        super(eventType, sink);
        this.t = t;
    }
}
typedef StringEventEmitter = Emitter<String>;
typedef BoolEventEmitter = Emitter<Bool>;
typedef NumberEventEmitter = Emitter<Float>;

class Attribute extends VDomModifier {
    public var title:String;
    public var value:String;

    public function new(title:String, ?value:String) {
        super();
        this.title = title;
        this.value = value;
    }

}
class AttributeStreamReceiver extends VDomModifier {
    public var attribute:String;
    public var attributeStream:Observable<Attribute>;

    public function new(attribute:String, ?attributeStream:Observable<Attribute>) {
        super();
        this.attribute = attribute;
        this.attributeStream = attributeStream;
    }
}
class ChildStreamReceiver extends VDomModifier {
    public var childStream:Observable<VNode>;

    public function new(?childStream:Observable<VNode>) {
        super();
        this.childStream = childStream;
    }
}
class ChildrenStreamReceiver extends VDomModifier {
    public var childrenStream:Observable<Array<VNode>>;

    public function new(?childrenStream:Observable<Array<VNode>>) {
        super();
        this.childrenStream = childrenStream;
    }
}
