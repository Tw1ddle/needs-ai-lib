package needs.ai;

import needs.ai.Action;
import needs.ai.ReasonerActionPickingStrategies;
import needs.util.Signal;
import needs.util.InstanceId;

/**
   The Reasoner class encapsulates sets of actions available to an agent. It exposes a technique for
   selecting the best available Action from a collection of ActionSets. It emits a signal when the Action it selects changes.
**/
class Reasoner<ReasonerIdType, ActionSetIdType, ActionIdType, ConsiderationIdType, InputIdType> {
	/**
	   Id for this object.
	 */
	public var instanceId(default, null):Int = InstanceId.makeId();
	
	/**
	   Id for this reasoner.
	**/
	public var id(default, null):ReasonerIdType = null;
	
	/**
	   Human-readable name of the reasoner.
	   Reasoners for an agent like a hungry NPC-eating werewolf might be named for context-specific sets of actions they encapsulate e.g. "Wilderness Action Sets", "Town Action Sets" etc.
	**/
	public var name(default, null):String = "";
	
	/**
	   The sets of actions available to the reasoner.
	**/
	public var actionSets(default, null):Array<ActionSet<ActionSetIdType, ActionIdType, ConsiderationIdType, InputIdType>> = null;
	
	/**
	   Signal emitted when the action selected by the reasoner changes.
	**/
	public var onActionChanged:Signal3<Reasoner<ReasonerIdType, ActionSetIdType, ActionIdType, ConsiderationIdType, InputIdType>, Action<ActionIdType, ConsiderationIdType, InputIdType>, Action<ActionIdType, ConsiderationIdType, InputIdType>> = null;
	
	/**
	   The last action the reasoner selected.
	**/
	public var lastAction(default, set):Action<ActionIdType, ConsiderationIdType, InputIdType> = null;
	
	/**
	   Returns the action sets sorted by their appropriateness by evaluating the sets using the reasoner's action set picking strategy.
	   @return The most appropriate action sets and their scores.
	*/
	public var selectActionSet:Void->Array<ActionSetScorePair<ActionSetIdType, ActionIdType, ConsiderationIdType, InputIdType>> = null;
	
	/**
	   Returns the most appropriate action from the sets by evaluating the actions using the reasoner's action picking strategy.
	   @return The most appropriate action in the set and its score.
	**/
	public var selectAction:Void->ActionScorePair<ActionIdType, ConsiderationIdType, InputIdType> = null;
	
	/**
	   @param	id Id for this reasoner.
	   @param	name The human-readable name of the reasoner.
	   @param	actionSets The collection of action sets that the reasoner starts with.
	**/
	public function new(id:ReasonerIdType, name:String, actionSets:Array<ActionSet<ActionSetIdType, ActionIdType, ConsiderationIdType, InputIdType>>) {
		this.id = id;
		this.name = name;
		this.actionSets = actionSets;
		onActionChanged = new Signal3<Reasoner<ReasonerIdType, ActionSetIdType, ActionIdType, ConsiderationIdType, InputIdType>, Action<ActionIdType, ConsiderationIdType, InputIdType>, Action<ActionIdType, ConsiderationIdType, InputIdType>>();
		lastAction = null;
		selectActionSet = ActionSetScoringStrategies.passthroughScoringStrategy.bind(this);
		selectAction = ReasonerActionPickingStrategies.highestScoringAction.bind(this);
	}
	
	/**
	   Triggers when the last action is set on the reasoner.
	 */
	private function set_lastAction(action:Action<ActionIdType, ConsiderationIdType, InputIdType>):Action<ActionIdType, ConsiderationIdType, InputIdType> {
		var last = lastAction;
		lastAction = action;
		
		if (action == null && last == null) {
			return action;
		}
		
		if ((action == null && last != null) || (action != null && last == null)) {
			onActionChanged.dispatch(this, last, action);
			return action;
		}
		
		if (last.id != action.id) {
			onActionChanged.dispatch(this, last, action);
			return action;
		}
		
		return action;
	}
}