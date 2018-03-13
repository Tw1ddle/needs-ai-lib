package needs.responses;

/**
   Polynomial response functions.
**/
class Polynomial {
	public static inline function quadIn(t:Float):Float {
		return t * t;
	}

	public static inline function quadOut(t:Float):Float {
		return -t * (t - 2);
	}

	public static inline function quadInOut(t:Float):Float {
		t *= 2;
		return (t < 1) ? 0.5 * t * t : -0.5 * ((t - 1) * (t - 3) - 1);
	}

	public static inline function quadOutIn(t:Float):Float {
		return (t < 0.5) ? quadOut(t * 2) * 0.5 : quadIn((t * 2) - 1) * 0.5 + 0.5;
	}
	
	public static inline function cubicIn(t:Float):Float {
		return t * t * t;
	}

	public static inline function cubicOut(t:Float):Float {
		t -= 1;
		return t * t * t + 1;
	}

	public static inline function cubicInOut(t:Float):Float {
		t *= 2;
		return (t < 1) ? 0.5 * t * t * t : 0.5 * ((t -= 2)* t * t + 2);
	}

	public static inline function cubicOutIn(t:Float):Float {
		return (t < 0.5) ? cubicOut(2 * t) / 2 : cubicIn(2 * t - 1) / 2 + 0.5;
	}
	
	public static inline function quartIn(t:Float):Float {
		return t * t * t * t;
	}

	public static inline function quartOut(t:Float):Float {
		t -= 1;
		return -(t * t * t * t - 1);
	}

	public static inline function quartInOut(t:Float):Float {
		t *= 2;
		return (t < 1) ? 0.5 * t * t * t * t : -0.5 * ((t -= 2) * t * t * t - 2);
	}

	public static inline function quartOutIn(t:Float):Float {
		return (t < 0.5) ? quartOut(2 * t) / 2 : quartIn(2 * t - 1) / 2 + 0.5;
	}
	
	public static inline function quintIn(t:Float):Float {
		return t * t * t * t * t;
	}

	public static inline function quintOut(t:Float):Float {
		t -= 1;
		return t * t * t * t * t + 1;
	}

	public static inline function quintInOut(t:Float):Float {
		t *= 2;
		return (t < 1) ? 0.5 * t * t * t * t * t : 0.5 * ((t -= 2) * t * t * t * t + 2);
	}

	public static inline function quintOutIn(t:Float):Float {
		return (t < 0.5) ? quintOut(2 * t) / 2 : quintIn(2 * t - 1) / 2 + 0.5;
	}
}