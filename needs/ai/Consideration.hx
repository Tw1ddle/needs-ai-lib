package needs.ai;

import needs.curves.Curve;

class Consideration {
	private var name:String;
	private var input:Input;
	private var curve:Curve;
	
	public function new() {
		
	}
	
	public function score():Float {
		return input.evaluate(curve);
	}
}