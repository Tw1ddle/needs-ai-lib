package needs.ai;

import needs.ai.Action;
import needs.ai.Consideration;

/**
   The ActionScoringStrategies class contains boilerplate methods for determining the utility of an Action.
   These scoring strategies combine the scores of individual Considerations to determine the total utility of an Action.
**/
class ActionScoringStrategies {
	/**
	   Determines the utility of an Action by multiplying the scores of the considerations.
	   Note that this exhibits odd behavior because actions with more considerations will tend to have lower scores
	   due to normalized multiplication e.g. (0.9 * 0.9 is less than 0.9 * 0.9 * 0.9).
	   @param	action The action whose utility will be determined.
	   @return	The utility of the action.
	**/
	public static function multiplyConsiderationScores<ActionIdType, ConsiderationIdType, InputIdType>(action:Action<ActionIdType, ConsiderationIdType, InputIdType>):Float {
		var considerations:Array<Consideration<ConsiderationIdType, InputIdType>> = action.considerations;
		
		if (considerations.length == 0) {
			return 0.0;
		}

		var score:Float = 1.0;
		for (consideration in considerations) {
			score *= consideration.score();
		}
		return score;
	}
	
	/**
	   Determines the utility of an Action by taking the mean score of the considerations.
	   @param	action The action whose utility will be determined.
	   @return	The utility of the action.
	**/
	public static function averageSumConsiderationScores<ActionIdType, ConsiderationIdType, InputIdType>(action:Action<ActionIdType, ConsiderationIdType, InputIdType>):Float {
		var considerations:Array<Consideration<ConsiderationIdType, InputIdType>> = action.considerations;
		
		if (considerations.length == 0) {
			return 0.0;
		}
		
		var score:Float = 0.0;
		var i:Int = 0;
		while (i < considerations.length) {
			score += considerations[i].score();
			++i;
		}
		
		if (score == 0) {
			return score;
		}
		
		return score / i;
	}
}