package needs.ai;

import haxe.ds.IntMap;

using needs.util.ArrayExtensions;

// Represents an AI
class Brain {
	public var world(default, null):Dynamic;
	public var needs(default, null):Array<Need>; // Reasons for doing stuff
	public var needTraits(default, null):IntMap<Float->Float>; // Motive traits affect the way some motives change over time e.g. slobs get hungrier faster
	public var actionTraits(default, null):IntMap<Float->Float>; // Action traits affect the way actions are calculated e.g. override or modify effects
	
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
	
	public var onActionSelected:Action->Void = null;
	
	public inline function new(world:Dynamic, needs:Array<Need>) {
		this.world = world;
		this.needs = needs;
		needTraits = new IntMap<Float->Float>();
		actionTraits = new IntMap<Float->Float>();
	}
	
	public function act(action:Action):Void {
		for (effect in action.effects) {
			effect.effect(world);
		}
	}
	
	public function update(dt:Float):Void {
		for (need in needs) {
			need.update(dt);
		}
		
		var aiMode:String = world.agent.aiMode;
		var need = switch(aiMode) {
			case Strategy.HIGHEST_NEEDS:
				getGreatestNeed();
			case Strategy.TRUE_RANDOM:
				getRandomNeed();
			case Strategy.WEIGHTED_RANDOM:
				getWeightedRandomNeed();
			default:
				null;
		}
		
		if (need != null) {
			var actions = findActions(need);
			
			if(onActionSelected != null) {
				onActionSelected(actions.randomElement());
			}
		}
	}
	
	private inline function getGreatestNeed():Need {
		var idx:Int = 0;
		var value:Float = 0;
		for (i in 0...needs.length) {
			if (needs[i].value > value) {
				value = needs[idx].value;
				idx = i;
			}
		}
		return needs[idx];
	}
	
	private inline function getWeightedRandomNeed():Need {
		return needs[0];
	}
	
	private inline function getRandomNeed():Need {
		return needs.randomElement();
	}
	
	private inline function findActions(need:Need):Array<Action> {
		return world.queryContextForActions(need);
	}
}