package needs.util;

/**
   Signal abstract helper class. A simple abstract over an array of callback functions.
**/
abstract Signal<T>(Array<T->Void>) {
	public inline function new() {
		this = [];
	}
	
	public inline function connect(listener:T->Void):Void {
		this.push(listener);
	}
	
	public inline function disconnect(listener:T->Void):Void {
		this.remove(listener);
	}
	
	public inline function dispatch(data:T):Void {
		for (listener in this) {
			listener(data);
		}
	}
}