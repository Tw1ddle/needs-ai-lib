package needs.ai;

// Models an agent, a brain and a means of performing actions
class Agent {
	public var brain(default, null):Brain;
	public var aiMode:Strategy;
	
	public function new(brain:Brain) {
		this.brain = brain;
		this.aiMode = Strategy.HIGHEST_NEEDS;
	}
	
	public function act(action:Action):Void {
		brain.act(action);
	}
	
	public function update(dt:Float):Void {
		brain.update(dt);
	}
}