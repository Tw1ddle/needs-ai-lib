package needs.ai;

import needs.inputs.Input;
import needs.responses.Response;

/**
   The Consideration class transforms an observation about the game world that your agent cares about into a utility score.
   A consideration produces the utility score by evaluating (or appraising) an Input - an aspect of the world the agent is interested in - against a response curve.
   This result is typically a floating point value, which is later used for calculating the overall utility of an Action available to the agent.
**/
class Consideration<ConsiderationIdType, InputIdType> {
	/**
	   Id for this consideration.
	**/
	public var id(default, null):ConsiderationIdType;
	
	/**
	   Human-readable name of the consideration.
	   For an NPC-eating werewolf hiding behind a park bench, considerations for an Option like "Eat NPC" could have names like "Hunger", "Crowdedness", "My Health" etc.
	**/
	public var name(default, null):String;
	
	/**
	   The aspect of the world that the AI agent is interested in with respect to this consideration.
	   If the consideration is "fear of wolves", the input might evaluate to "number of wolves nearby, normalized in range 0-1".
	**/
	public var input:Input<InputIdType>;
	
	/**
	   The response function that the value of the input is evaluated with.
	**/
	public var response:Response;
	
	/**
	   @param	id Id for this consideration.
	   @param	name The human-readable name for the consideration.
	   @param	input The input.
	   @param	curve The response curve.
	**/
	public function new(id:ConsiderationIdType, name:String, input:Input<InputIdType>, response:Response) {
		this.id = id;
		this.name = name;
		this.input = input;
		this.response = response;
	}
	
	/**
	   Calculates a utility score/floating point value for the consideration by evaluating the Input against a response function.
	   @return The utility score/floating point value for the consideration, usually a value in the range 0-1.
	**/
	public function score():Float {
		return input.evaluate(response);
	}
}