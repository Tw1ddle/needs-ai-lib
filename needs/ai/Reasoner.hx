package needs.ai;

import needs.util.Signal;

/**
   The Reasoner class encapsulates sets of actions available to an agent. It exposes a technique for
   selecting the best available Action from a collection of ActionSets. It emits a signal when the Action it selects changes.
**/
class Reasoner {
	/**
	   Human-readable name of the reasoner.
	   Reasoners for an agent like a hungry NPC-eating werewolf might be named for context-specific sets of actions they encapsulate e.g. "Wilderness Action Sets", "Town Action Sets" etc.
	**/
	public var name(default, null):String;
	
	/**
	   The sets of actions available to the reasoner.
	**/
	public var actionSets(default, null):Array<ActionSet>;
	
	/**
	   The last action the reasoner selected.
	**/
	public var lastAction(default, null):Action;
	
	/**
	   Signal emitted when the action selected by the reasoner changes.
	**/
	public var onActionChanged:Signal3<Reasoner, Action, Action>;
	
	/**
	   Returns the highest utility action in the set by evaluating the actions using an action set scoring strategy.
	   @return The highest utility action in the set.
	**/
	public var select:Void->Action;
	
	public function new(name:String, actionSets:Array<ActionSet>) {
		this.name = name;
		this.actionSets = actionSets;
		lastAction = null;
		onActionChanged = new Signal3<Reasoner, Action, Action>();
	}
}