package outwatch.dom.helpers;
import Reflect;
import js.html.InputEvent;
import js.html.MouseEvent;
import js.html.Event;
import rx.Subject;
import js.html.KeyboardEvent;
import rx.Observable;
using rx.Observable;
import outwatch.dom.VDomModifier.VDomModifier;
import outwatch.dom.VDomModifier.Attribute;
import outwatch.dom.VDomModifier.AttributeStreamReceiver;
import outwatch.dom.VDomModifier.BoolEventEmitter;
import outwatch.dom.VDomModifier.ChildrenStreamReceiver;
import outwatch.dom.VDomModifier.ChildStreamReceiver;
import outwatch.dom.VDomModifier.Emitter;
import outwatch.dom.VDomModifier.EventEmitter;
import outwatch.dom.VDomModifier.GenericEmitter;
import outwatch.dom.VDomModifier.StringNode;
import outwatch.dom.VDomModifier.InputEventEmitter;
import outwatch.dom.VDomModifier.KeyEventEmitter;
import outwatch.dom.VDomModifier.MouseEventEmitter;
import outwatch.dom.VDomModifier.NumberEventEmitter;
import outwatch.dom.VDomModifier.StringEventEmitter;
import outwatch.dom.VDomModifier.VNode;
abstract KeyEventEmitterBuilder(KeyEventEmitter) {
    public function new(v:KeyEventEmitter) {
        this = v;
    }

    @:op(A > B)
    public function emitter(sink:Sink<KeyboardEvent>) {
        var tmp:KeyEventEmitter = cast this;
        tmp.sink = sink;
        return new KeyEventEmitterBuilder(tmp);
    }

    @:from
    public inline static function fromString(eventType:String) {
        return new KeyEventEmitterBuilder( new KeyEventEmitter(eventType));
    }

    @:to
    public inline function toVDomModifier():KeyEventEmitter {
        return   this;
    }
}

abstract AttributeBuilder(Attribute) {
    public function new(v:Attribute) {
        this = v;
    }

    @:op(A - B)
    public function access(value:Any) {
        var tmp:Attribute = cast this;
        tmp.value = Std.string(value);
        return new AttributeBuilder(tmp);
    }

    @:op(A < B)
    public function link(valueStream:Observable<Any>) {
        var tmp:Attribute = cast this;
        var tmp2 = new AttributeStreamReceiver(tmp.title, valueStream.map(function(b) {
            return new Attribute(tmp.title, Std.string(b));
        }));
        return    tmp2;
    }

    @:from
    public inline static function fromString(attributeName:String) {
        return new AttributeBuilder( new Attribute(attributeName));
    }

    @:to
    public inline function toVDomModifier():Attribute {
        return this;
    }

}

abstract BoolAttributeBuilder(Attribute) {
    public function new(v:Attribute) {
        this = v;
    }

    @:op(A - B)
    public function access(value:Bool) {
        var tmp:Attribute = cast this;
        tmp.value = toEmptyIfFalse(value);
        return new BoolAttributeBuilder(tmp);
    }

    @:op(A < B)
    public function link(valueStream:Observable<Bool>) {
        var tmp:Attribute = cast this;
        var tmp2 = new AttributeStreamReceiver(tmp.title, valueStream.map(function(b) {
            return new Attribute(tmp.title, toEmptyIfFalse(b));
        }));
        return  tmp2;
    }

    @:from
    public inline static function fromString(attributeName:String) {
        return new BoolAttributeBuilder( new Attribute(attributeName, toEmptyIfFalse(false)));
    }

    @:to
    public inline function toVDomModifier():Attribute {
        return this;
    }

    inline static function toEmptyIfFalse(b:Bool) {
        return if (b)   "true" else "false";
    }
}


abstract InputEventEmitterBuilder(InputEventEmitter) {
    public function new(v:InputEventEmitter) {
        this = v;
    }

    @:op(A > B)
    public function emitter(sink:Sink<InputEvent>) {
        var tmp:InputEventEmitter = cast this;
        tmp.sink = sink;
        return new InputEventEmitterBuilder(tmp);
    }

    @:from
    public inline static function fromString(eventType:String) {
        return new InputEventEmitterBuilder( new InputEventEmitter(eventType));
    }

    @:to
    public inline function toVDomModifier():InputEventEmitter {
        return this;
    }
}


abstract MouseEventEmitterBuilder(MouseEventEmitter) {
    public function new(v:MouseEventEmitter) {
        this = v;
    }

    @:op(A > B)
    public function emitter(sink:Sink<MouseEvent>) {
        var tmp:MouseEventEmitter = cast this;
        tmp.sink = sink;
        return new MouseEventEmitterBuilder(tmp);
    }

    @:from
    public inline static function fromString(eventType:String) {
        return new MouseEventEmitterBuilder( new MouseEventEmitter(eventType));
    }

    @:to
    public inline function toVDomModifier():MouseEventEmitter {
        return this;
    }
}


abstract StringEventEmitterBuilder(StringEventEmitter) {
    public function new(v:StringEventEmitter) {
        this = v;
    }

    @:op(A > B)
    public function emitter(sink:Sink<String>) {
        var tmp:StringEventEmitter = cast this;
        tmp.sink = sink;
        return new StringEventEmitterBuilder(tmp);
    }

    @:from
    public inline static function fromString(eventType:String) {
        return new StringEventEmitterBuilder( new StringEventEmitter(eventType));
    }

    @:to
    public inline function toVDomModifier():StringEventEmitter {
        return this;
    }
}


abstract BoolEventEmitterBuilder(BoolEventEmitter) {
    public function new(v:BoolEventEmitter) {
        this = v;
    }

    @:op(A > B)
    public function emitter(sink:Sink<Bool>) {
        var tmp:BoolEventEmitter = cast this;
        tmp.sink = sink;
        return new BoolEventEmitterBuilder(tmp);
    }

    @:from
    public inline static function fromString(eventType:String) {
        return new BoolEventEmitterBuilder( new BoolEventEmitter(eventType));
    }

    @:to
    public inline function toVDomModifier():BoolEventEmitter {
        return this;
    }
}


abstract NumberEventEmitterBuilder(NumberEventEmitter) {
    public function new(v:NumberEventEmitter) {
        this = v;
    }

    @:op(A > B)
    public function emitter(sink:Sink<Float>) {
        var tmp:NumberEventEmitter = cast this;
        tmp.sink = sink;
        return new NumberEventEmitterBuilder(tmp);
    }

    @:from
    public inline static function fromString(eventType:String) {
        return new NumberEventEmitterBuilder( new NumberEventEmitter(eventType));
    }

    @:to
    public inline function toVDomModifier():NumberEventEmitter {
        return this;
    }
}


abstract ChildStreamReceiverBuilder(ChildStreamReceiver) {
    public function new(v:ChildStreamReceiver) {
        this = v;
    }

    @:op(A < B)
    public function link(valueStream:Observable<Any>) {
        var tmp:ChildStreamReceiver = cast this;
        var childStream:Observable<VNode> = valueStream.map(anyToVNode);
        tmp.childStream = childStream;
        return new ChildStreamReceiverBuilder(tmp);
    }

    private function anyToVNode(any:Any):VNode {
        return switch Type.getClass(any) {
            case VNode:
                cast any;
            case _ :
                new StringNode(any );
        };
    }

    @:to
    public inline function toVDomModifier():ChildStreamReceiver {
        return this;
    }
}


abstract ChildrenStreamReceiverBuilder(ChildrenStreamReceiver) {
    public function new(v:ChildrenStreamReceiver) {
        this = v;
    }

    @:op(A < B)
    public function link(childrenStream:Observable<Array<VNode>>) {
        var tmp:ChildrenStreamReceiver = cast this;
        tmp.childrenStream = childrenStream;
        return new ChildrenStreamReceiverBuilder(tmp);
    }

    @:op(A - B)
    public function access(childrenStream:Array<VNode>) {
        return link(Observable.of(childrenStream));
    }

    @:to
    public inline function toVDomModifier():ChildrenStreamReceiver {
        return this;
    }
}



