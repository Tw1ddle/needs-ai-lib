package needs.inputs;

import needs.responses.Response;
import needs.util.InstanceId;

/**
   Interface for an Input. An Input represents an aspect of the game world the agent is interested in.
   An Input is evaluated against a response curve to produce the utility score for a consideration.
**/
class Input<InputIdType> {
	/**
	   Id for this object.
	 */
	public var instanceId(default, null):Int = InstanceId.makeId();
	
	/**
	   Id for this input.
	**/
	public var id(default, null):InputIdType = null;
	
	/**
	   Evaluates (appraises) an aspect of the game world against a response function, producing a utility score. Typically you will normalize this value into the range 0-1.
	   For example, "BossMonsterHealth" could have a range of "0 to MaxBossHealth", which you might normalize to 0-1 like "var value:Float = clamp(CurrentBossHealth/MaxBossHealth, 0, 1)".
	   @param	response The response function you should evaluate your normalized input against.
	   @return	A floating point utility score, typically in the range 0-1.
	**/
	public function evaluate(response:Response):Float {
		return 0.0;
	}
}