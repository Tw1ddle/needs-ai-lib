package needs.ai;

import haxe.ds.IntMap;
import msignal.Signal;

import World;

using util.ArrayExtensions;

// Represents an AI
class Brain {
	public var world(default, null):Dynamic;
	public var needs(default, null):Array<Need>; // Reasons for doing stuff
	public var needTraits(default, null):IntMap<Float->Float>; // Motive traits affect the way some motives change over time e.g. slobs get hungrier faster
	public var actionTraits(default, null):IntMap<Float->Float>; // Action traits affect the way actions are calculated e.g. override or modify effects
	
	public var signal_selectedAction:Signal1<Action> = new Signal1<Action>();
	
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
		
		var need = switch(world.agent.aiMode) {
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
			signal_selectedAction.dispatch(actions.randomElement());
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
		Sure.sure(world.queryContextForActions != null);
		return world.queryContextForActions(need);
	}
}