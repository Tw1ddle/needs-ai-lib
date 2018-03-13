package needs.responses;

/**
   Exponential response curve functions.
**/
class Exponential {
	public static inline function expoIn(t:Float):Float {
		return (t == 0) ? 0 : Math.pow(2, 10 * (t - 1));
	}

	public static inline function expoOut(t:Float):Float {
		return (t == 1) ? 1 : - Math.pow(2, -10 * t) + 1;
	}

	public static inline function expoInOut(t:Float):Float {
		if (t == 0) {
			return t;
		}
		if (t == 1) {
			return t;
		}
		t *= 2;
		if (t < 1) {
			return 0.5 * Math.pow(2, 10 * (t - 1));
		}
		return 0.5 * ( -Math.pow(2, -10 * (t - 1)) + 2);
	}

	public static inline function expoOutIn(t:Float):Float {
		return (t < 0.5) ? expoOut(2 * t) / 2 : expoIn(2 * t - 1) / 2 + 0.5;
	}
}