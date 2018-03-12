package needs.ai;

import needs.ai.Action;
import needs.ai.Reasoner;

/**
   The ReasonerActionPickingStrategies class contains boilerplate methods that a Reasoner uses to select the most appropriate Action.
**/
class ReasonerActionPickingStrategies {
	/**
	   Selects the best Action for a Reasoner by picking the one with the highest utility score.
	   @param	reasoner The reasoner whose action sets will be picked from.
	   @return	The action with the highest utility score and the score itself.
	**/
	public static function highestScoringAction<ReasonerIdType, ActionSetIdType, ActionIdType, ConsiderationIdType>(reasoner:Reasoner<ReasonerIdType, ActionSetIdType, ActionIdType, ConsiderationIdType>):ActionScorePair<ActionIdType, ConsiderationIdType> {
		var actionSets:Array<ActionSet<ActionSetIdType, ActionIdType, ConsiderationIdType>> = reasoner.actionSets;
		
		var maxPair:ActionScorePair<ActionIdType, ConsiderationIdType> = { action: null, score: 0 };
		var i:Int = 0;
		while (i < actionSets.length) {
			var pair:ActionScorePair<ActionIdType, ConsiderationIdType> = actionSets[i].select();
			if (pair != null && pair.score >= maxPair.score) {
				maxPair = pair;
			}
			i++;
		}
		return maxPair;
	}
}