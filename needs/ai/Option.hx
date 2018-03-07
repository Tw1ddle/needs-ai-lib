package needs.ai;

/**
    The Option class represents an action that an agent has the option of intending/attempting to perform within the game world.
    It encapsulates a collection of Considerations that are evaluated to calculate an overall utility score for the Option.
**/
class Option {
	/**
	   Human-readable name of the option.
	   For an NPC-eating werewolf in a park, available Options might be called "Eat NPC" and "Hide In Bush"
	**/
	public var name(default, null):String;
	/**
	   Collection of considerations that are evaluated to calculate an overall utility score for the option.
	**/
	public var considerations(default, null):Array<Consideration>;
	
	/**
	   @param	name The human-readable name of the option.
	   @param	considerations The collection of reasoners that the option starts with.
	**/
	public function new(name:String, considerations:Array<Consideration>) {
		this.name = name;
		this.considerations = considerations;
	}
	
	/**
	   Calculates a utility score/floating point value for the consideration by evaluating the considerations.
	   @return The utility score/floating point value for the consideration, usually a value in the range 0-1.
	**/
	public function score():Float {
		if (considerations.length == 0) {
			return 0.0;
		}

		var score:Float = 1.0;
		for (consideration in considerations) {
			score *= consideration.score();
		}
		return score;
	}
}