package needs.ai;

// TODO tag bag, for negotiating "bonus" utility for some actions e.g. for two specific npcs needing to talk to each other
// TODO just used as token passing. perhaps something a "smart" environment does to the NPCs, not the NPCs themselves

// TODO vetos e.g. no ammo in weapon, therefore don't even consider shooting. or no movement, so don't consider any walking - let's us turn off things to consider easily

// TODO ensure utility scores are normalized functions e.g. 0-1

// TODO needs to be 100% data driven in theory, specify everything in xml files or similar and read in macro or at runtime?
// TODO make a tool so it's easy to create considerations as piecewise functions in 0-1 range

// TODO considerations/reasoner selection to have random noise option to ensure we don't always choose the same thing (easily vetoable to disable)

// TODO solve inertia problem with cooldowns/momentum so agents don't repeat tasks e.g. eat pizza 10 times in row - probably by making it possible to weight intents against repeats (in a arbitrary way)
// TODO add concept of cost of utility maximization/bounded rationality

// TODO in demo, invert awareness of actions by having the environment populate buckets for npcs to fish from e.g. "fear bucket", "hunger bucket"
// TODO in demo add easy method for creating considerations for cost of distance/time
// TODO in demo make it easy to add hacks like "indoors consideration" to easily disable some things in certain areas e.g. throwing grenades indoors

// TODO imagine creating a game like this
// var manager = new NeedsAIManager(); (or via macro?)
// manager.loadProject(project);
// loadProject populates the manager with behavior sets created using the embedded knowledge base, archetypes, with the given considerations etc

class Agent {
	private var reasoners:Array<Reasoner>;
	
	private var onIntentChanged:Reasoner->Intent->Intent;
	
	public function new(reasoners:Array<Reasoner>) {
		for (reasoner in reasoners) {
			reasoner.onIntentChanged = onIntentChanged;
		}
	}
	
	public function step(millis:Float):Void {
		for (reasoner in reasoners) {
			reasoner.step(millis);
		}
	}
}