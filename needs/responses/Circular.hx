package needs.responses;

/**
   Circular response curve functions.
**/
class Circular {
	public static inline function circIn(t:Float):Float {
		return -(Math.sqrt(1 - t * t) - 1);
	}

	public static inline function circOut(t:Float):Float {
		t -= 1;
		return Math.sqrt(1 - t * t);
	}

	public static inline function circInOut(t:Float):Float {
		t *= 2;
		return (t < 1) ? -0.5 * (Math.sqrt(1 - t * t) - 1) : 0.5 * (Math.sqrt(1 - (t -= 2) * t) + 1);
	}

	public static inline function circOutIn(t:Float):Float {
		return (t < 0.5) ? circOut(2 * t) / 2 : circIn(2 * t - 1) / 2 + 0.5;
	}
}