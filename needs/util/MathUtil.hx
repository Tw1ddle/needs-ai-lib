package needs.util;

class MathUtil {
	/**
	   Clamps a value within the bounds of the min and max values.
	**/
	public inline static function clamp(value:Float, min:Float, max:Float):Float {
		if (value < min) {
			return min;
		} else if (value > max) {
			return max;
		} else {
			return value;
		}
	}
}