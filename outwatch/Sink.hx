package outwatch;
import rx.Observer;
import rx.Observable;
import rx.Subject;
class Sink<T> extends Subject<T> {


    public function link(observable:Observable<T>):Sink<T> {
        observable.subscribe(this);
        return this ;
    }


    static public function create<T>(onNext:T -> Void):Sink<T> {
        var sink:Sink<T> = new Sink<T>();
        sink.subscribe(Observer.create(null, null, onNext));
        return (sink);
    }

    static public function createHandler<T>():Sink<T> {
        var sink:Sink<T> = new Sink<T>();
        return (sink);
    }
}
