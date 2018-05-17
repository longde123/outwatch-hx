package outwatch.dom;
import js.html.KeyboardEvent;
import js.html.MouseEvent;
import js.html.InputEvent;
import outwatch.dom.VDomModifier.Attribute;
import haxe.macro.Expr;
import outwatch.dom.helpers.EventEmitterBuilder.AttributeBuilder;
import outwatch.dom.helpers.EventEmitterBuilder.BoolAttributeBuilder;
import outwatch.dom.helpers.EventEmitterBuilder.BoolEventEmitterBuilder;
import outwatch.dom.helpers.EventEmitterBuilder.ChildrenStreamReceiverBuilder;
import outwatch.dom.helpers.EventEmitterBuilder.ChildStreamReceiverBuilder;
import outwatch.dom.helpers.EventEmitterBuilder.InputEventEmitterBuilder;
import outwatch.dom.helpers.EventEmitterBuilder.KeyEventEmitterBuilder;
import outwatch.dom.helpers.EventEmitterBuilder.MouseEventEmitterBuilder;
import outwatch.dom.helpers.EventEmitterBuilder.NumberEventEmitterBuilder;
import outwatch.dom.helpers.EventEmitterBuilder.StringEventEmitterBuilder;
import outwatch.dom.VDomModifier.ChildStreamReceiver;
import outwatch.dom.VDomModifier.ChildrenStreamReceiver;
import outwatch.dom.helpers.DomUtils;
class Dom {

    static public function div(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("div", args);}
    static public function span(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("span", args);}
    static public function h1(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("h1", args); }

    static public function button(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("button", args); }

    static public function a(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("a", args); }

    static public function label(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("label", args); }

    static public function input(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("input", args); }

    static public function hr(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("hr", args); }

    static public function ul(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("ul", args); }

    static public function abbr(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("abbr", args); }

    static public function address(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("address", args); }

    static public function area(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("area", args); }

    static public function article(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("article", args); }

    static public function aside(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("aside", args); }

    static public function audio(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("audio", args); }

    static public function b(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("b", args); }

    static public function base(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("base", args); }

    static public function bdi(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("bdi", args); }

    static public function blockquote(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("blockquote", args); }

    static public function br(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("br", args); }

    static public function li(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("li", args); }

    static public function bdo(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("bdo", args); }

    static public function canvas(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("canvas", args); }

    static public function caption(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("caption", args); }

    static public function cite(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("cite", args); }

    static public function code(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("code", args); }

    static public function col(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("col", args); }

    static public function colgroup(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("colgroup", args); }

    static public function datalist(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("datalist", args); }

    static public function dd(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("dd", args); }

    static public function del(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("del", args); }

    static public function details(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("details", args); }

    static public function dfn(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("dfn", args); }

    static public function dialog(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("dialog", args); }

    static public function dl(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("dl", args); }

    static public function dt(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("dt", args); }

    static public function em(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("em", args); }

    static public function embed(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("embed", args); }

    static public function fieldset(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("fieldset", args); }

    static public function figcaption(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("figcaption", args); }

    static public function figure(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("figure", args); }

    static public function footer(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("footer", args); }

    static public function form(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("form", args); }

    static public function header(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("header", args); }

    static public function h2(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("h2", args); }

    static public function h3(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("h3", args); }

    static public function h4(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("h4", args); }

    static public function h5(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("h5", args); }

    static public function h6(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("h6", args); }

    static public function i(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("i", args); }

    static public function iframe(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("iframe", args); }

    static public function img(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("img", args); }

    static public function ins(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("ins", args); }

    static public function keygen(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("keygen", args); }

    static public function legend(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("legend", args); }

    static public function main(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("main", args); }

    static public function mark(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("mark", args); }

    static public function menu(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("menu", args); }

    static public function menuitem(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("menuitem", args); }

    static public function meter(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("meter", args); }

    static public function nav(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("nav", args); }

    static public function ol(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("ol", args); }

    static public function optgroup(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("optgroup", args); }

    static public function option(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("option", args); }

    static public function output(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("output", args); }

    static public function p(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("p", args); }

    static public function param(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("param", args); }

    static public function pre(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("pre", args); }

    static public function progress(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("progress", args); }

    static public function section(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("section", args); }

    static public function select(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("select", args); }

    static public function small(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("small", args); }

    static public function strong(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("strong", args); }

    static public function sub(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("sub", args); }

    static public function summary(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("summary", args); }

    static public function sup(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("sup", args); }

    static public function table(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("table", args); }

    static public function tbody(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("tbody", args); }

    static public function td(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("td", args); }

    static public function textarea(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("textarea", args); }

    static public function tfoot(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("tfoot", args); }

    static public function th(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("th", args); }

    static public function thead(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("thead", args); }

    static public function time(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("time", args); }

    static public function tr(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("tr", args); }

    static public function track(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("track", args); }

    static public function video(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("video", args); }

    static public function wbr(args:Array<VDomModifier>) { return DomUtils.hyperscriptHelper("wbr", args); }

    static public var hidden(get, null):BoolAttributeBuilder;

    static function get_hidden() {
        var ba:BoolAttributeBuilder = ("hidden");
        return ba;
    }
    static public var value(get, null):AttributeBuilder;

    static function get_value() {
        var ba:AttributeBuilder = ("value");
        return ba;
    }
    static public var disabled(get, null):BoolAttributeBuilder;

    static function get_disabled() {
        var ba:BoolAttributeBuilder = ("disabled");
        return ba;
    }
    static public var style(get, null):AttributeBuilder;

    static function get_style() {
        var ba:AttributeBuilder = ("style");
        return ba;
    }
    static public var alt(get, null):AttributeBuilder;

    static function get_alt() {
        var ba:AttributeBuilder = ("alt");
        return ba;
    }
    static public var autocomplete(get, null):AttributeBuilder;

    static function get_autocomplete() {
        var ba:AttributeBuilder = ("autocomplete");
        return ba;
    }
    static public var autofocus(get, null):AttributeBuilder;

    static function get_autofocus() {
        var ba:AttributeBuilder = ("autofocus");
        return ba;
    }
    static public var charset(get, null):AttributeBuilder;

    static function get_charset() {
        var ba:AttributeBuilder = ("charset");
        return ba;
    }

    static public var cols(get, null):AttributeBuilder;

    static function get_cols() {
        var ba:AttributeBuilder = ("cols");
        return ba;
    }
    static public var rows(get, null):AttributeBuilder;

    static function get_rows() {
        var ba:AttributeBuilder = ("rows");
        return ba;
    }
    static public var colspan(get, null):AttributeBuilder;

    static function get_colspan() {
        var ba:AttributeBuilder = ("colspan");
        return ba;
    }

    static public var rowspan(get, null):AttributeBuilder;

    static function get_rowspan() {
        var ba:AttributeBuilder = ("rowspan");
        return ba;
    }
    static public var download(get, null):AttributeBuilder;

    static function get_download() {
        var ba:AttributeBuilder = ("download");
        return ba;
    }

    static public var id(get, null):AttributeBuilder;

    static function get_id() {
        var ba:AttributeBuilder = ("id");
        return ba;
    }
    static public var max(get, null):AttributeBuilder;

    static function get_max() {
        var ba:AttributeBuilder = ("max");
        return ba;
    }
    static public var min(get, null):AttributeBuilder;

    static function get_min() {
        var ba:AttributeBuilder = ("min");
        return ba;
    }
    static public var name(get, null):AttributeBuilder;

    static function get_name() {
        var ba:AttributeBuilder = ("name");
        return ba;
    }
    static public var accept(get, null):AttributeBuilder;

    static function get_accept() {
        var ba:AttributeBuilder = ("accept");
        return ba;
    }
    static public var src(get, null):AttributeBuilder;

    static function get_src() {
        var ba:AttributeBuilder = ("src");
        return ba;
    }
    static public var srcset(get, null):AttributeBuilder;

    static function get_srcset() {
        var ba:AttributeBuilder = ("srcset");
        return ba;
    }
    static public var checked(get, null):BoolAttributeBuilder;

    static function get_checked() {
        var ba:BoolAttributeBuilder = ("checked");
        return ba;
    }
    static public var coords(get, null):AttributeBuilder;

    static function get_coords() {
        var ba:AttributeBuilder = ("coords");
        return ba;
    }
    static public var data(get, null):AttributeBuilder;

    static function get_data() {
        var ba:AttributeBuilder = ("data");
        return ba;
    }
    static public var list(get, null):AttributeBuilder;

    static function get_list() {
        var ba:AttributeBuilder = ("list");
        return ba;
    }
    static public var multiple(get, null):AttributeBuilder;

    static function get_multiple() {
        var ba:AttributeBuilder = ("multiple");
        return ba;
    }
    static public var datetime(get, null):AttributeBuilder;

    static function get_datetime() {
        var ba:AttributeBuilder = ("datetime");
        return ba;
    }
    static public var placeholder(get, null):AttributeBuilder;

    static function get_placeholder() {
        var ba:AttributeBuilder = ("placeholder");
        return ba;
    }
    static public var radiogroup(get, null):AttributeBuilder;

    static function get_radiogroup() {
        var ba:AttributeBuilder = ("radiogroup");
        return ba;
    }
    static public var readonly(get, null):BoolAttributeBuilder;

    static function get_readonly() {
        var ba:BoolAttributeBuilder = ("readonly");
        return ba;
    }

    static public var required(get, null):BoolAttributeBuilder;

    static function get_required() {
        var ba:BoolAttributeBuilder = ("required");
        return ba;
    }

    static public var reversed(get, null):AttributeBuilder;

    static function get_reversed() {
        var ba:AttributeBuilder = ("reversed");
        return ba;
    }
    static public var scope(get, null):AttributeBuilder;

    static function get_scope() {
        var ba:AttributeBuilder = ("scope");
        return ba;
    }
    static public var selected(get, null):AttributeBuilder;

    static function get_selected() {
        var ba:AttributeBuilder = ("selected");
        return ba;
    }
    static public var size(get, null):AttributeBuilder;

    static function get_size() {
        var ba:AttributeBuilder = ("size");
        return ba;
    }
    static public var sizes(get, null):AttributeBuilder;

    static function get_sizes() {
        var ba:AttributeBuilder = ("sizes");
        return ba;
    }
    static public var step(get, null):AttributeBuilder;

    static function get_step() {
        var ba:AttributeBuilder = ("step");
        return ba;
    }
    static public var summaryAttr(get, null):AttributeBuilder;

    static function get_summaryAttr() {
        var ba:AttributeBuilder = ("summary2");
        return ba;
    }
    static public var target(get, null):AttributeBuilder;

    static function get_target() {
        var ba:AttributeBuilder = ("target");
        return ba;
    }
    static public var usemap(get, null):AttributeBuilder;

    static function get_usemap() {
        var ba:AttributeBuilder = ("usemap");
        return ba;
    }
    static public var wrap(get, null):AttributeBuilder;

    static function get_wrap() {
        var ba:AttributeBuilder = ("wrap");
        return ba;
    }
    static public var type(get, null):AttributeBuilder;

    static function get_type() {
        var ba:AttributeBuilder = ("type");
        return ba;
    }
    static public var tpe(get, null):AttributeBuilder;

    static function get_tpe() {
        return get_type();
    }
    static public var inputType(get, null):AttributeBuilder;

    static function get_inputType() {
        return get_type();
    }
    static public var className(get, null):AttributeBuilder;

    static function get_className() {
        var ba:AttributeBuilder = ("class");
        return ba;
    }
    static public var cls(get, null):AttributeBuilder;

    static function get_cls() {
        return get_className();
    }
    static public var forLabel(get, null):AttributeBuilder;

    static function get_forLabel() {
        var ba:AttributeBuilder = ("for");
        return ba;
    }

    static public var keydown(get, null):KeyEventEmitterBuilder;

    static function get_keydown() {
        var ba:KeyEventEmitterBuilder = ("keydown");
        return ba;
    }
    static public var click(get, null):MouseEventEmitterBuilder;

    static function get_click() {
        var ba:MouseEventEmitterBuilder = ("click");
        return ba;
    }
    static public var resize(get, null):MouseEventEmitterBuilder;

    static function get_resize() {
        var ba:MouseEventEmitterBuilder = ("resize");
        return ba;
    }
    static public var mousedown(get, null):MouseEventEmitterBuilder;

    static function get_mousedown() {
        var ba:MouseEventEmitterBuilder = ("mousedown");
        return ba;
    }
    static public var mouseover(get, null):MouseEventEmitterBuilder;

    static function get_mouseover() {
        var ba:MouseEventEmitterBuilder = ("mouseover");
        return ba;
    }
    static public var mouseenter(get, null):MouseEventEmitterBuilder;

    static function get_mouseenter() {
        var ba:MouseEventEmitterBuilder = ("mouseenter");
        return ba;
    }

    static public var mousemove(get, null):MouseEventEmitterBuilder;

    static function get_mousemove() {
        var ba:MouseEventEmitterBuilder = ("mousemove");
        return ba;
    }
    static public var mouseleave(get, null):MouseEventEmitterBuilder;

    static function get_mouseleave() {
        var ba:MouseEventEmitterBuilder = ("mouseleave");
        return ba;
    }

    static public var inputEmit(get, null):InputEventEmitterBuilder;

    static function get_inputEmit() {
        var ba:InputEventEmitterBuilder = ("inputEmit");
        return ba;
    }
    static public var change(get, null):InputEventEmitterBuilder;

    static function get_change() {
        var ba:InputEventEmitterBuilder = ("change");
        return ba;
    }
    static public var blur(get, null):InputEventEmitterBuilder;

    static function get_blur() {
        var ba:InputEventEmitterBuilder = ("blur");
        return ba;
    }

    static public var keyup(get, null):KeyEventEmitterBuilder;

    static function get_keyup() {
        var ba:KeyEventEmitterBuilder = ("keyup");
        return ba;
    }


    static public var keypress(get, null):KeyEventEmitterBuilder;

    static function get_keypress() {
        var ba:KeyEventEmitterBuilder = ("keypress");
        return ba;
    }


    static public var inputNumber(get, null):NumberEventEmitterBuilder;

    static function get_inputNumber() {
        var ba:NumberEventEmitterBuilder = ("input");
        return ba;
    }

    static public var child(get, null):ChildStreamReceiverBuilder;

    static function get_child() {
        var ba:ChildStreamReceiverBuilder = new ChildStreamReceiverBuilder(new ChildStreamReceiver());
        return ba;
    }

    static public var children(get, null):ChildrenStreamReceiverBuilder;

    static function get_children() {
        var ba:ChildrenStreamReceiverBuilder = new ChildrenStreamReceiverBuilder(new ChildrenStreamReceiver());
        return ba;
    }


    static public function createInputHandler():Sink<InputEvent> {
        return Sink.createHandler();
    }

    static public function createMouseHandler():Sink<MouseEvent> {
        return Sink.createHandler();
    }

    static public function createKeyboardHandler():Sink<KeyboardEvent> {
        return Sink.createHandler();
    }

    static public function createStringHandler():Sink<String> {
        return Sink.createHandler();
    }

    static public function createBoolHandler():Sink<Bool> {
        return Sink.createHandler();
    }

    static public function createNumberHandler():Sink<Float> {
        return Sink.createHandler();
    }


}
