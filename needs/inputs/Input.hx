package needs.inputs;

import needs.curves.Curve;

interface Input {
	function evaluate(curve:Curve):Float;
}