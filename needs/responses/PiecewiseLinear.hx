package needs.responses;

/**
   Piecewise linear response functions.
**/
class PiecewiseLinear {
	public static inline function make(points:Array<Float>):Response {
		return response.bind(points);
	}
	
	public static inline function response(points:Array<Float>, x:Float):Float {
		inline function lerp(a:Float, b:Float, f:Float):Float {
			return a + f * (b - a);
		};
		
		var segments:Int = points.length - 1;
		var segmentLength:Float = 1 / segments;
		
		x = Math.min(1, Math.max(0, x));
		var segmentIdx:Int = Math.floor(x * segments);
		
		var basePoint:Int = segmentIdx;
		var nextPoint:Int = segmentIdx + 1;
		
		var p1:Float = points[basePoint];
		var p2:Float = points[nextPoint];
		
		var segmentT:Float = (x - (segmentLength * segmentIdx)) / segmentLength;
		return lerp(p1, p2, segmentT);
	}
}
