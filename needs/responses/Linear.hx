package needs.responses;

import needs.util.MathUtil;

/**
   Linear response functions.
**/
class Linear {
	/**
	   Makes a linear response function.
	   @param	m The slope/gradient.
	   @param	c The constant shift, the point at which the line crosses the y-axis.
	   @return The linear response function.
	**/
	public static function make(m:Float, c:Float):Response {
		return response.bind(m, c);
	}
	
	private static inline function response(m:Float, c:Float, x:Float):Float {
		return MathUtil.clamp(m * x + c);
	}
}