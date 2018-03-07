package needs.ai;

import needs.curves.Curve;
import needs.inputs.Input;

/**
   The Consideration class transforms an observation about the game world your agent cares about into a utility score.
   A consideration produces the utility score by evaluating an Input - an aspect of the world the agent is interested in - against a response curve.
   This result is typically a floating point value, which is later used for calculating the overall utility of an Option available to the agent.
**/
class Consideration {
	/**
	   Human-readable name of the consideration.
	   For an NPC-eating werewolf hiding behind a park bench, considerations for an Option like "Eat NPC" could have names like "Hunger", "Crowdedness", "My Health" etc.
	**/
	public var name(default, null):String;
	/**
	   The aspect of the world that the AI agent is interested in with respect to this consideration.
	   If the consideration is "fear of wolves", the input might evaluate to "number of wolves nearby, normalized in range 0-1".
	**/
	public var input:Input;
	/**
	   The response curve that the value of the input is evaluated with.
	**/
	public var curve:Curve;
	
	/**
	   @param	name The human-readable name for the consideration.
	   @param	input The input.
	   @param	curve The response curve.
	**/
	public function new(name:String, input:Input, curve:Curve) {
		this.name = name;
		this.input = input;
		this.curve = curve;
	}
	
	/**
	   Calculates a utility score/floating point value for the consideration by evaluating the Input against a response curve.
	   @return The utility score/floating point value for the consideration, usually a value in the range 0-1.
	**/
	public function score():Float {
		return input.evaluate(curve);
	}
}