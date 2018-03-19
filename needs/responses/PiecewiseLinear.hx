package needs.responses;

/**
   Piecewise linear response functions.
**/
class PiecewiseLinear {
	public function make(points:Array<Float>):Response {
		return response.bind(points);
	}
	
	private static inline function response(points:Array<Float>):Float {
		
	}
}