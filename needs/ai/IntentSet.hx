package needs.ai;

import needs.ai.Intent;

class IntentSet {
	private var intents:Array<Intent>;
	
	public function new(intents:Array<Intent>) {
		this.intents = intents;
	}
	
	public function score() {
		return 0; // TODO
	}
}