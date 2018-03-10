package needs.inputs;

import needs.responses.Response;

// TODO add parameters for computing utility from generic distance measures for two generic objects
// TODO will this need macros or can haxe generics do it?
class DistanceInput implements Input {
	public function new() {
		
	}
	
	public function evaluate(response:Response):Float {
		return 1.0; // TODO
	}
}