package needs.util;

/**
   Math-related utility functions.
**/
class MathUtil {
	/**
	   Clamps a value within the bounds of the min and max values.
	**/
	public inline static function clamp(value:Float, min:Float = 0, max:Float = 1):Float {
		if (value < min) {
			return min;
		} else if (value > max) {
			return max;
		} else {
			return value;
		}
	}
}