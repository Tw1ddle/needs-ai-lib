package needs.ai;

import needs.util.InstanceId;

/**
   The Action class represents an action that an agent has the option of intending/attempting to perform within the game world.
   It encapsulates a collection of Considerations that are evaluated using a scoring function to calculate an overall utility score for the Action.
**/
class Action<ActionIdType, ConsiderationIdType, InputIdType> {
	/**
	   Id for this object.
	 */
	public var instanceId(default, null):Int = InstanceId.makeId();
	
	/**
	   Id for this action.
	**/
	public var id(default, null):ActionIdType = null;
	
	/**
	   Human-readable name of the action.
	   For an NPC-eating werewolf in a park, available Actions might be called "Eat NPC" and "Hide In Bush".
	**/
	public var name(default, null):String = "";
	
	/**
	   Collection of considerations that are evaluated to calculate an overall utility score for the action.
	**/
	public var considerations(default, null):Array<Consideration<ConsiderationIdType, InputIdType>> = null;
	
	/**
	   @param	id Id for this action.
	   @param	name The human-readable name of the action.
	   @param	considerations The collection of considerations that the action starts with.
	**/
	public function new(id:ActionIdType, name:String, considerations:Array<Consideration<ConsiderationIdType, InputIdType>>) {
		this.id = id;
		this.name = name;
		this.considerations = considerations;
		
		// Default to multiplication of (presumably normalized) consideration scores to determine action utility
		this.score = ActionScoringStrategies.multiplyConsiderationScores.bind(this);
	}
	
	/**
	   Calculates a utility score/floating point value for the action by evaluating the considerations using the action scoring strategy.
	   @return The utility score/floating point value for the action, usually normalized to the range 0-1.
	**/
	public var score:Void->Float = null;
}