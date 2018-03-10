package needs.ai;

import needs.util.Signal;

// TODO tag bag/blackboard objects (variant maps, lots of ids?), for negotiating "bonus" utility for some actions e.g. for two specific npcs needing to talk to each other
// TODO just used as token passing. perhaps something a "smart" environment does to the NPCs, not the NPCs themselves

// TODO considerations/reasoner selection to have optional random noise option to ensure we don't always choose the same thing (easily vetoable to disable)

// TODO solve inertia problem with cooldowns/momentum so agents don't repeat tasks e.g. eat pizza 10 times in row, probably by making it possible to weight intents against repeats (in a arbitrary way)
// TODO add concept of cost of utility maximization/bounded rationality

// TODO figure out how to make a configuration of the brain completely data driven using macros - possibly a way to serialize/unserialize the state of the brain (i.e. the brain is the project file)
// TODO have some sort of loadProject method that builds a pre-populated manager with behavior sets created using an XML knowledge base etc

// TODO add macro that can add metadata to label all classes with info like IDs so that checking is easier in game code

/**
   The Brain class represents the top-level reasoning element of your utility-based AI agent.
   It encapsulates a collection of Reasoners, which it updates to drive decision-making logic of the agent.
   The Brain broadcasts when the actions its reasoners pick change, which other parts of the codebase e.g. an animation system, can listen to.
**/
class Brain {
	/**
	   A collection of reasoners that drive the decision-making logic of the brain.
	   Using multiple reasoners is useful when you want to easily partition and enable/disable categories decision logic.
	   For example, an agent might only have the "Tavern" reasoner activated while they are near or inside a tavern.
	**/
	private var reasoners:Array<Reasoner>;
	
	/**
	   Callback triggered when a reasoner changes the action that it has selected.
	**/
	public var onActionChanged(default, null):Signal3<Reasoner, Action, Action>;
	
	/**
	   Callback triggered when a reasoner is added to the brain.
	**/
	public var onReasonerAdded(default, null):Signal2<Brain, Reasoner>;
	
	/**
	   Callback triggered when a reasoner is removed from the brain.
	**/
	public var onReasonerRemoved(default, null):Signal2<Brain, Reasoner>;
	
	/**
	   @param	reasoners The collection of reasoners that the brain starts with.
	**/
	public function new(reasoners:Array<Reasoner>) {
		onActionChanged = new Signal3<Reasoner, Action, Action>();
		onReasonerAdded = new Signal2<Brain, Reasoner>();
		onReasonerRemoved = new Signal2<Brain, Reasoner>();
		
		for (reasoner in reasoners) {
			addReasoner(reasoner);
		}
	}
	
	/**
	   Updates the reasoners in the brain.
	**/
	public function update():Void {
		for (reasoner in reasoners) {
			reasoner.update();
		}
	}
	
	/**
	   Adds a reasoner to the brain.
	   @param	reasoner The reasoner to add.
	**/
	public function addReasoner(reasoner:Reasoner):Void {
		reasoners.push(reasoner);
		reasoner.onActionChanged = onActionChanged;
		onReasonerAdded.dispatch(this, reasoner);
	}
	
	/**
	   Removes a reasoner from the brain, if it is present in the brain.
	   @param	reasoner The reasoner to remove.
	**/
	public function removeReasoner(reasoner:Reasoner):Void {
		reasoners.remove(reasoner);
		reasoner.onActionChanged = null;
		onReasonerRemoved.dispatch(this, reasoner);
	}
}