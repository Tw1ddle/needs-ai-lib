package needs.ai;

import needs.ai.Action;
import needs.ai.ReasonerActionPickingStrategies;
import needs.util.Signal;

// TODO considerations/reasoner selection to have optional random noise option to ensure we don't always choose the same thing (easily vetoable to disable)

/**
   The Reasoner class encapsulates sets of actions available to an agent. It exposes a technique for
   selecting the best available Action from a collection of ActionSets. It emits a signal when the Action it selects changes.
**/
class Reasoner<ReasonerIdType, ActionSetIdType, ActionIdType, ConsiderationIdType> {
	/**
	   Id for this reasoner.
	**/
	public var id(default, null):ReasonerIdType;
	
	/**
	   Human-readable name of the reasoner.
	   Reasoners for an agent like a hungry NPC-eating werewolf might be named for context-specific sets of actions they encapsulate e.g. "Wilderness Action Sets", "Town Action Sets" etc.
	**/
	public var name(default, null):String;
	
	/**
	   The sets of actions available to the reasoner.
	**/
	public var actionSets(default, null):Array<ActionSet<ActionSetIdType, ActionIdType, ConsiderationIdType>>;
	
	/**
	   The last action the reasoner selected.
	**/
	public var lastAction(default, null):Action<ActionIdType, ConsiderationIdType>;
	
	/**
	   Signal emitted when the action selected by the reasoner changes.
	**/
	public var onActionChanged:Signal3<Reasoner<ReasonerIdType, ActionSetIdType, ActionIdType, ConsiderationIdType>, Action<ActionIdType, ConsiderationIdType>, Action<ActionIdType, ConsiderationIdType>>;
	
	/**
	   Returns the most appropriate action in the set by evaluating the actions using the reasoner's action picking strategy.
	   @return The the most appropriate action in the set and its score.
	**/
	public var select:Void->ActionScorePair<ActionIdType, ConsiderationIdType>;
	
	/**
	   @param	id Id for this reasoner.
	   @param	name The human-readable name of the reasoner.
	   @param	actionSets The collection of action sets that the reasoner starts with.
	**/
	public function new(id:ReasonerIdType, name:String, actionSets:Array<ActionSet<ActionSetIdType, ActionIdType, ConsiderationIdType>>) {
		this.id = id;
		this.name = name;
		this.actionSets = actionSets;
		lastAction = null;
		onActionChanged = new Signal3<Reasoner<ReasonerIdType, ActionSetIdType, ActionIdType, ConsiderationIdType>, Action<ActionIdType, ConsiderationIdType>, Action<ActionIdType, ConsiderationIdType>>();
		select = ReasonerActionPickingStrategies.highestScoringAction.bind(this);
	}
}