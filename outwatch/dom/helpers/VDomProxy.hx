package outwatch.dom.helpers;
import outwatch.dom.helpers.LambdaExtensions.Grouping;
import js.html.InputElement;
import js.html.Event;
import outwatch.dom.VDomModifier.Emitter;
import outwatch.dom.VDomModifier.ChildStreamReceiver;
import outwatch.dom.VDomModifier.ChildrenStreamReceiver;
import outwatch.dom.VDomModifier.Attribute;
import outwatch.dom.VDomModifier.AttributeStreamReceiver;
import outwatch.dom.VDomModifier.VNode;
import outwatch.dom.VDomModifier.VTree;
import outwatch.dom.VDomModifier.Pair;
import outwatch.dom.VDomModifier.MouseEventEmitter;
import outwatch.dom.VDomModifier.KeyEventEmitter;
import outwatch.dom.VDomModifier.InputEventEmitter;
import outwatch.dom.VDomModifier.StringEventEmitter;
import outwatch.dom.VDomModifier.BoolEventEmitter;
import outwatch.dom.VDomModifier.NumberEventEmitter;
import outwatch.dom.VDomModifier.GenericEmitter;
import outwatch.dom.VDomModifier.EventEmitter;
import snabbdom.dom.VirtualNodeDom as VNodeProxy;
class VDomProxy {

    static public function attrsToSnabbDom(attributes:Array<Attribute>) {
        //Map<String,String>
        var obj = {};
        for (attr in attributes) {
            Reflect.setField(obj, attr.title, attr.value);
        }
        return obj;
    }


    static public function emittersToSnabbDom(eventEmitters:Array<Emitter<Any>>) {
        //Map<String,Array< Event ->Void>>

        var eventEmitterLists =
        LambdaExtensions.groupBy(eventEmitters,
        function(e:Emitter<Any>) return e.eventType,
        function(e) return e);
        var obj = {};
        for (e in eventEmitterLists) {
            Reflect.setField(obj, e.Key, emittersToFunction(e.Items));
        }
        return obj;
    }

    private static function emittersToFunction(emitters:Array<Emitter<Any>>):Event -> Void {
        return function(e:Event) {
            var em:Array< Event -> Void> = emitters.map(emitterToFunction);
            for (m in em) {
                m(e);
            }
        };
    }

    private static function emitterToFunction(emitter:Emitter<Any>):Event -> Void {
        if (Std.is(emitter, MouseEventEmitter)) {
            var me:MouseEventEmitter = cast emitter;
            return function(e:Event) return me.sink.on_next(cast e);
        }
        if (Std.is(emitter, KeyEventEmitter)) {
            var ke:KeyEventEmitter = cast emitter;
            return function(e:Event) return ke.sink.on_next(cast e);
        }
        if (Std.is(emitter, InputEventEmitter)) {
            var ie:InputEventEmitter = cast emitter;
            return function(e:Event) return ie.sink.on_next(cast e);
        }
        if (Std.is(emitter, StringEventEmitter)) {
            var se:StringEventEmitter = cast emitter;
            return function(e:Event) return se.sink.on_next(cast(e.target, InputElement).value);
        }if (Std.is(emitter, BoolEventEmitter)) {
            var be:BoolEventEmitter = cast emitter;
            return function(e:Event) return be.sink.on_next(cast(e.target, InputElement).checked);
        }
        if (Std.is(emitter, NumberEventEmitter)) {
            var ne:NumberEventEmitter = cast emitter;
            return function(e:Event) return ne.sink.on_next(Std.parseFloat(cast(e.target, InputElement).value));
        }
        if (Std.is(emitter, GenericEmitter)) {
            var ge:GenericEmitter<Any> = cast emitter;
            return function(e:Event)return ge.sink.on_next(ge.t);
        }
        if (Std.is(emitter, EventEmitter)) {
            var ee:EventEmitter = cast emitter;
            return function(e:Event) return ee.sink.on_next(e);
        }
        return function(e:Event) return emitter.sink.on_next(e);
    }
}
