package needs.responses;

/**
   Sine response curve functions.
**/
class Sine {
	public static inline function sineIn(t:Float):Float {
		return -Math.cos(t * Math.PI / 2.0) + 1;
	}

	public static inline function sineOut(t:Float):Float {
		return Math.sin(t * Math.PI / 2.0);
	}

	public static inline function sineInOut(t:Float):Float {
		return -0.5 * (Math.cos(Math.PI * t) - 1);
	}

	public static inline function sineOutIn(t:Float):Float {
		return (t < 0.5) ? sineOut(2 * t) / 2 : sineIn(2 * t - 1) / 2 + 0.5;
	}
}