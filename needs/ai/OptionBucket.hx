package needs.ai;

import needs.ai.Option;

/**
   The OptionBucket represents a collection of options, each represents an action that an agent has the option of attempting to perform within the game world.
   It encapsulates a collection of Options that are evaluated using an OptionScoringStrategy to pick an option to perform.
**/
class OptionBucket {
	/**
	   The collection of options. Each option represents an action that an agent has the option of attempting to perform within the game world.
	**/
	private var options:Array<Option>;
	
	public function new(options:Array<Option>) {
		this.options = options;
	}
	
	public function score() {
		
	}
}