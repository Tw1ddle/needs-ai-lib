package needs.util;

/**
   Signal abstract helper class. A simple abstract over an array of listeners/callback functions.
**/
abstract Signal0(Array<Void->Void>) {
	public inline function new() {
		this = [];
	}
	
	/**
	   Connects the listener to the signal.
	   @param	listener The listener function to connect.
	**/
	public inline function connect(listener:Void->Void):Void {
		this.push(listener);
	}
	
	/**
	   Disconnects the listener from the signal.
	   @param	listener The listener function to disconnect.
	**/
	public inline function disconnect(listener:Void->Void):Void {
		this.remove(listener);
	}
	
	/**
	   Calls all of the listeners/callback functions connected to the signal.
	**/
	public inline function dispatch():Void {
		for (listener in this) {
			listener();
		}
	}
}

/**
   Signal abstract helper class. A simple abstract over an array of listeners/callback functions.
**/
abstract Signal1<T>(Array<T->Void>) {
	public inline function new() {
		this = [];
	}
	
	/**
	   Connects the listener to the signal.
	   @param	listener The listener function to connect.
	**/
	public inline function connect(listener:T->Void):Void {
		this.push(listener);
	}
	
	/**
	   Disconnects the listener from the signal.
	   @param	listener The listener function to disconnect.
	**/
	public inline function disconnect(listener:T->Void):Void {
		this.remove(listener);
	}
	
	/**
	   Calls all of the listeners/callback functions connected to the signal.
	   @param	data0 The parameter used for the dispatch.
	**/
	public inline function dispatch(data0:T):Void {
		for (listener in this) {
			listener(data0);
		}
	}
}

/**
   Signal abstract helper class. A simple abstract over an array of listeners/callback functions.
**/
abstract Signal2<T,U>(Array<T->U->Void>) {
	public inline function new() {
		this = [];
	}
	
	/**
	   Connects the listener to the signal.
	   @param	listener The listener function to connect.
	**/
	public inline function connect(listener:T->U->Void):Void {
		this.push(listener);
	}
	
	/**
	   Disconnects the listener from the signal.
	   @param	listener The listener function to disconnect.
	**/
	public inline function disconnect(listener:T->U->Void):Void {
		this.remove(listener);
	}
	
	/**
	   Calls all of the listeners/callback functions connected to the signal.
	   @param	data0 The first parameter used for the dispatch.
	   @param	data1 The second parameter used for the dispatch.
	**/
	public inline function dispatch(data0:T, data1:U):Void {
		for (listener in this) {
			listener(data0, data1);
		}
	}
}

/**
   Signal abstract helper class. A simple abstract over an array of listeners/callback functions.
**/
abstract Signal3<T,U,V>(Array<T->U->V->Void>) {
	public inline function new() {
		this = [];
	}
	
	/**
	   Connects the listener to the signal.
	   @param	listener The listener function to connect.
	**/
	public inline function connect(listener:T->U->V->Void):Void {
		this.push(listener);
	}
	
	/**
	   Disconnects the listener from the signal.
	   @param	listener The listener function to disconnect.
	**/
	public inline function disconnect(listener:T->U->V->Void):Void {
		this.remove(listener);
	}
	
	/**
	   Calls all of the listeners/callback functions connected to the signal.
	   @param	data0 The first parameter used for the dispatch.
	   @param	data1 The second parameter used for the dispatch.
	   @param	data2 The third parameter used for the dispatch.
	**/
	public inline function dispatch(data0:T, data1:U, data2:V):Void {
		for (listener in this) {
			listener(data0, data1, data2);
		}
	}
}

/**
   Signal abstract helper class. A simple abstract over an array of listeners/callback functions.
**/
abstract Signal4<T,U,V,X>(Array<T->U->V->X->Void>) {
	public inline function new() {
		this = [];
	}
	
	/**
	   Connects the listener to the signal.
	   @param	listener The listener function to connect.
	**/
	public inline function connect(listener:T->U->V->X->Void):Void {
		this.push(listener);
	}
	
	/**
	   Disconnects the listener from the signal.
	   @param	listener The listener function to disconnect.
	**/
	public inline function disconnect(listener:T->U->V->X->Void):Void {
		this.remove(listener);
	}
	
	/**
	   Calls all of the listeners/callback functions connected to the signal.
	   @param	data0 The first parameter used for the dispatch.
	   @param	data1 The second parameter used for the dispatch.
	   @param	data2 The third parameter used for the dispatch.
	   @param	data3 The fourth parameter used for the dispatch.
	**/
	public inline function dispatch(data0:T, data1:U, data2:V, data3:X):Void {
		for (listener in this) {
			listener(data0, data1, data2, data3);
		}
	}
}