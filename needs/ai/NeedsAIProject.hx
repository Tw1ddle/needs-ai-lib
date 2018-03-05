package needs.ai;

// TODO tag bag, for negotiating "bonus" utility for some actions e.g. for two specific npcs needing to talk to each other

// TODO just used as token passing. perhaps something a "smart" environment does to the NPCs, not the NPCs themselves

// TODO vetos e.g. no ammo in weapon, therefore don't even consider shooting. or no movement, so don't consider any walking - let's us turn off things to consider easily

// TODO ensure utility scores are normalized functions e.g. 0-1

// TODO needs to be 100% data driven in theory, specify everything in xml files or similar and read in macro or at runtime?

// TODO considerations like random noise to ensure we don't always choose the same thing (easily vetoable to disable)

// TODO make it easy to add hacks like "indoors consideration" to easily disable some things in certain areas e.g. grenades indoors

// TODO make a tool so it's easy to create considerations as piecewise functions in 0-1 range

// TODO could invert awareness of actions by having the environment populate buckets for npcs to fish from e.g. "fear bucket", "hunger bucket"

// TODO solve inertia problem with cooldowns so agents don't repeat tasks e.g. eat pizza 10 times in row - probably by making it possible to weight considerations against repeats (in a arbitrary way)

// TODO handle action interruption? related to this?

// TODO concept of cost of utility maximization/bounderd rationality

// TODO utility is situational, this means we need to be able to compute magnitude/relevance of need within context of game world (e.g. fire extinguisher recognized as most useful when someone is on fire)

class NeedsAIProject {
	public function new() {
		
	}
}