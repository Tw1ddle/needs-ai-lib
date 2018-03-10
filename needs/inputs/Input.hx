package needs.inputs;

import needs.curves.Curve;

/**
   Interface for an Input. An Input represents an aspect of the game world the agent is interested in.
   An Input is evaluated against a response curve to produce the utility score for a consideration.
**/
interface Input {
	/**
	   Evaluates (appraises) an aspect of the game world against a response curve, producing a utility score. Typically you will normalize this value into the range 0-1.
	   For example, "BossMonsterHealth" could have a range of "0 to MaxBossHealth", which you might normalize to 0-1 like "var value:Float = clamp(CurrentBossHealth/MaxBossHealth, 0, 1)".
	   @param	curve The response curve that the evaluation function you are expected to evaluate your normalized input against.
	   @return	A floating point utility score, typically in the range 0-1.
	**/
	function evaluate(curve:Curve):Float;
}