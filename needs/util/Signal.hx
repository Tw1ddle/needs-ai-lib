package needs.util;

/**
   Signal abstract helper class. A simple abstract over an array of listeners/callback functions.
**/
abstract Signal0(Array<Void->Void>) from Array<Void->Void> to Array<Void->Void> {
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
abstract Signal1<T>(Array<T->Void>) from Array<T->Void> to Array<T->Void> {
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
abstract Signal2<T,U>(Array<T->U->Void>) from Array<T->U->Void> to Array<T->U->Void> {
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
abstract Signal3<T,U,V>(Array<T->U->V->Void>) from Array<T->U->V->Void> to Array<T->U->V->Void> {
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
abstract Signal4<T,U,V,W>(Array<T->U->V->W->Void>) from Array<T->U->V->W->Void> to Array<T->U->V->W->Void> {
	public inline function new() {
		this = [];
	}
	
	/**
	   Connects the listener to the signal.
	   @param	listener The listener function to connect.
	**/
	public inline function connect(listener:T->U->V->W->Void):Void {
		this.push(listener);
	}
	
	/**
	   Disconnects the listener from the signal.
	   @param	listener The listener function to disconnect.
	**/
	public inline function disconnect(listener:T->U->V->W->Void):Void {
		this.remove(listener);
	}
	
	/**
	   Calls all of the listeners/callback functions connected to the signal.
	   @param	data0 The first parameter used for the dispatch.
	   @param	data1 The second parameter used for the dispatch.
	   @param	data2 The third parameter used for the dispatch.
	   @param	data3 The fourth parameter used for the dispatch.
	**/
	public inline function dispatch(data0:T, data1:U, data2:V, data3:W):Void {
		for (listener in this) {
			listener(data0, data1, data2, data3);
		}
	}
}

/**
   Signal abstract helper class. A simple abstract over an array of listeners/callback functions.
**/
abstract Signal5<T,U,V,W,X>(Array<T->U->V->W->X->Void>) from Array<T->U->V->W->X->Void> to Array<T->U->V->W->X->Void> {
	public inline function new() {
		this = [];
	}
	
	/**
	   Connects the listener to the signal.
	   @param	listener The listener function to connect.
	**/
	public inline function connect(listener:T->U->V->W->X->Void):Void {
		this.push(listener);
	}
	
	/**
	   Disconnects the listener from the signal.
	   @param	listener The listener function to disconnect.
	**/
	public inline function disconnect(listener:T->U->V->W->X->Void):Void {
		this.remove(listener);
	}
	
	/**
	   Calls all of the listeners/callback functions connected to the signal.
	   @param	data0 The first parameter used for the dispatch.
	   @param	data1 The second parameter used for the dispatch.
	   @param	data2 The third parameter used for the dispatch.
	   @param	data3 The fourth parameter used for the dispatch.
	   @param	data4 The fifth parameter used for the dispatch.
	**/
	public inline function dispatch(data0:T, data1:U, data2:V, data3:W, data4:X):Void {
		for (listener in this) {
			listener(data0, data1, data2, data3, data4);
		}
	}
}

/**
   Signal abstract helper class. A simple abstract over an array of listeners/callback functions.
**/
abstract Signal6<T,U,V,W,X,Y>(Array<T->U->V->W->X->Y->Void>) from Array<T->U->V->W->X->Y->Void> to Array<T->U->V->W->X->Y->Void> {
	public inline function new() {
		this = [];
	}
	
	/**
	   Connects the listener to the signal.
	   @param	listener The listener function to connect.
	**/
	public inline function connect(listener:T->U->V->W->X->Y->Void):Void {
		this.push(listener);
	}
	
	/**
	   Disconnects the listener from the signal.
	   @param	listener The listener function to disconnect.
	**/
	public inline function disconnect(listener:T->U->V->W->X->Y->Void):Void {
		this.remove(listener);
	}
	
	/**
	   Calls all of the listeners/callback functions connected to the signal.
	   @param	data0 The first parameter used for the dispatch.
	   @param	data1 The second parameter used for the dispatch.
	   @param	data2 The third parameter used for the dispatch.
	   @param	data3 The fourth parameter used for the dispatch.
	   @param	data4 The fifth parameter used for the dispatch.
	   @param	data5 The sixth parameter used for the dispatch.
	**/
	public inline function dispatch(data0:T, data1:U, data2:V, data3:W, data4:X, data5:Y):Void {
		for (listener in this) {
			listener(data0, data1, data2, data3, data4, data5);
		}
	}
}

/**
   Signal abstract helper class. A simple abstract over an array of listeners/callback functions.
**/
abstract Signal7<T,U,V,W,X,Y,Z>(Array<T->U->V->W->X->Y->Z->Void>) from Array<T->U->V->W->X->Y->Z->Void> to Array<T->U->V->W->X->Y->Z->Void> {
	public inline function new() {
		this = [];
	}
	
	/**
	   Connects the listener to the signal.
	   @param	listener The listener function to connect.
	**/
	public inline function connect(listener:T->U->V->W->X->Y->Z->Void):Void {
		this.push(listener);
	}
	
	/**
	   Disconnects the listener from the signal.
	   @param	listener The listener function to disconnect.
	**/
	public inline function disconnect(listener:T->U->V->W->X->Y->Z->Void):Void {
		this.remove(listener);
	}
	
	/**
	   Calls all of the listeners/callback functions connected to the signal.
	   @param	data0 The first parameter used for the dispatch.
	   @param	data1 The second parameter used for the dispatch.
	   @param	data2 The third parameter used for the dispatch.
	   @param	data3 The fourth parameter used for the dispatch.
	   @param	data4 The fifth parameter used for the dispatch.
	   @param	data5 The sixth parameter used for the dispatch.
	   @param	data6 The seventh parameter used for the dispatch.
	**/
	public inline function dispatch(data0:T, data1:U, data2:V, data3:W, data4:X, data5:Y, data6:Z):Void {
		for (listener in this) {
			listener(data0, data1, data2, data3, data4, data5, data6);
		}
	}
}