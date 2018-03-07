package needs.ai;

// TODO tag bag, for negotiating "bonus" utility for some actions e.g. for two specific npcs needing to talk to each other
// TODO just used as token passing. perhaps something a "smart" environment does to the NPCs, not the NPCs themselves

// TODO vetos e.g. no ammo in weapon, therefore don't even consider shooting. or no movement, so don't consider any walking - let's us turn off things to consider easily

// TODO needs to be 100% data driven in theory, specify everything in xml files or similar and read in macro or at runtime?
// TODO make a tool so it's easy to create considerations as piecewise functions in 0-1 range

// TODO considerations/reasoner selection to have optional random noise option to ensure we don't always choose the same thing (easily vetoable to disable)

// TODO solve inertia problem with cooldowns/momentum so agents don't repeat tasks e.g. eat pizza 10 times in row, probably by making it possible to weight intents against repeats (in a arbitrary way)
// TODO add concept of cost of utility maximization/bounded rationality

// TODO in demo, invert awareness of actions by having the environment populate buckets for npcs to fish from e.g. "fear bucket", "hunger bucket"
// TODO in demo add easy method for creating considerations for cost of distance/time
// TODO in demo make it easy to add hacks like "indoors consideration" to easily disable some things in certain areas e.g. throwing grenades indoors

// TODO figure out how to make the needs/options/inputs completely data driven using macros
// Have some sort of loadProject method that builds a pre-populated manager with behavior sets created using an XML knowledge base etc

/**
   The Brain class represents the top-level reasoning element of your utility-based AI agent.
   It encapsulates a collection of Reasoners, which it updates to drive decision-making logic of the agent.
   The brain broadcasts when the intents its reasoners pick change, which other parts of the codebase e.g. an animation system, can listen to.
**/
class Brain {
	/**
	   A collection of reasoners that drive the decision-making logic of the brain.
	   Using multiple reasoners is useful when you want to easily partition and enable/disable categories decision logic.
	   For example, an agent might only have the "Tavern" reasoner activated while they are near or inside a tavern.
	**/
	private var reasoners:Array<Reasoner>;
	
	/**
	   Callback triggered when a reasoner changes the intent that it has selected.
	**/
	public var onIntentChanged:Reasoner->Option->Option;
	
	/**
	   @param	reasoners The collection of reasoners that the brain starts with.
	**/
	public function new(reasoners:Array<Reasoner>) {
		for (reasoner in reasoners) {
			reasoner.onIntentChanged = onIntentChanged;
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
	
	public function addReasoner(reasoner:Reasoner):Void {
		// TODO
		reasoners.push(reasoner);
	}
	
	public function removeReasoner(reasoner:Reasoner):Void {
		// TODO
		reasoners.remove(reasoner);
	}
}