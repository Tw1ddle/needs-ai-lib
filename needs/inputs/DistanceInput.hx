package needs.inputs;

import lib.needs-ai-lib.needs.response.Curve;

// TODO add parameters for computing utility from generic distance measures for two generic objects
// TODO will this need macros or can haxe generics do it?
class DistanceInput implements Input {
	public function new() {
		
	}
	
	public function evaluate(curve:Curve):Float {
		return 1.0; // TODO
	}
}