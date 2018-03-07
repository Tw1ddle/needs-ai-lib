package needs.ai;

import needs.ai.Option;

/**
   The OptionBucket represents a collection of actions, each of which an agent has the option of intending/attempting to perform within the game world.
   It encapsulates a collection of Options that are evaluated using an OptionScoringStrategy to pick an option to perform.
**/
class OptionBucket {
	private var options:Array<Option>;
	
	public function new(options:Array<Option>) {
		this.options = options;
	}
	
	public function score() {
		return 0; // TODO
	}
}