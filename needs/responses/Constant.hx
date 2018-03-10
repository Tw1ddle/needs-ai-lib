package needs.responses;

import needs.util.MathUtil;

/**
   Constant response functions.
**/
class Constant {
	/**
	   Makes a constant response function.
	   @param	c The constant to return.
	   @return The constant.
	**/
	public static function make(c:Float):Response {
		return response.bind(c);
	}
	
	private static inline function response(c:Float):Float {
		return MathUtil.clamp(c, 0, 1);
	}
}