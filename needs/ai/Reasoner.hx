package needs.ai;

class Reasoner {
	private var intentSets:Array<IntentSet>; // TODO sort by weights/queue
	
	// TODO record last chosen intent?
	
	public var onIntentChanged:Reasoner->Intent->Intent;
	
	public function new() {
		
	}
	
	public function step(dt:Float):Intent {
		for (set in intentSets) {
			set.score();
		}
		
		return null; // TODO
	}
}