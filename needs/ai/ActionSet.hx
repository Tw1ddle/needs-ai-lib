package needs.ai;

import needs.ai.Action;
import needs.ai.ActionPickingStrategies;
import needs.ai.ActionScorePair;
import needs.util.InstanceId;

/**
   The ActionSet represents a set of Actions, each of which an agent has the option of attempting to perform within the game world.
   It encapsulates a collection of Actions that are evaluated using a scoring function to pick the most-preferred action to perform.
**/
class ActionSet<ActionSetIdType, ActionIdType, ConsiderationIdType, InputIdType> {
	/**
	   Id for this object.
	 */
	public var instanceId(default, null):Int = InstanceId.makeId();
	
	/**
	   Id for this action set.
	**/
	public var id(default, null):ActionSetIdType = null;
	
	/**
	   Human-readable name of the action set.
	   For a NPC-eating werewolf that likes to hide in the shadows, an ActionSet might have names like "NPC-eating-related Actions", or "Hiding-related Actions".
	**/
	public var name(default, null):String = "";
	
	/**
	   The set of actions. Each item represents an action that an agent has the option of attempting to perform within the game world.
	**/
	public var actions(default, null):Array<Action<ActionIdType, ConsiderationIdType, InputIdType>> = null;
	
	/**
	   Returns the most appropriate action in the set by evaluating the actions using an action set scoring strategy.
	   @return The most appropriate action in the set and its score value.
	**/
	public var select:Void->ActionScorePair<ActionIdType, ConsiderationIdType, InputIdType> = null;
	
	/**
	   @param	id Id for this action set.
	   @param	name The human-readable name of the action set.
	   @param	actions The collection of actions that the action set starts with.
	**/
	public function new(id:ActionSetIdType, name:String, actions:Array<Action<ActionIdType, ConsiderationIdType, InputIdType>>) {
		this.id = id;
		this.name = name;
		this.actions = actions;
		this.select = ActionPickingStrategies.highestScoringAction.bind(this);
	}
}