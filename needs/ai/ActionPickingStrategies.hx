package needs.ai;

import needs.ai.Action;
import needs.ai.ActionScorePair;

/**
   The ActionPickingStrategies class contains boilerplate methods for choosing the most appropriate action from a ActionSet.
**/
class ActionPickingStrategies {
	/**
	   Determines the most appropriate action from a set of actions by picking the action with the highest utility score.
	   Returns null if no actions are in the set, or if the only available actions have a negative score.
	   @param	actionSet The set of actions to choose the most appropriate action from.
	   @return	The action with the highest utility score and its score.
	**/
	public static function highestScoringAction<ActionSetIdType, ActionIdType, ConsiderationIdType, InputIdType>(actionSet:ActionSet<ActionSetIdType, ActionIdType, ConsiderationIdType, InputIdType>):ActionScorePair<ActionIdType, ConsiderationIdType, InputIdType> {
		var actions:Array<Action<ActionIdType, ConsiderationIdType, InputIdType>> = actionSet.actions;
		
		var maxScore:Float = 0;
		var action:Action<ActionIdType, ConsiderationIdType, InputIdType> = null;
		var i:Int = 0;
		while (i < actions.length) {
			var score = actions[i].score();
			if (score >= maxScore) {
				maxScore = score;
				action = actions[i];
			}
			i++;
		}
		return { action: action, score: maxScore };
	}
}