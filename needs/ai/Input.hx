package needs.ai;

import needs.curves.Curve;

interface Input {
	function evaluate(curve:Curve):Float;
}