package needs.ai;

/**
   The ReasonerActionPickingStrategies class contains boilerplate methods that a Reasoner uses to select the most appropriate Action.
**/
class ReasonerActionPickingStrategies {
	/**
	   Selects the best Action for a Reasoner by picking the one with the highest utility score.
	   @param	reasoner The reasoner whose action sets will be picked from.
	   @return	The selected action.
	**/
	public static function highestScoringAction(reasoner:Reasoner):Action {
		var actionSets:Array<ActionSet> = reasoner.actionSets;
		
		var action:Action = null;
		for (actionSet in actionSets) {
			// TODO
		}
		
		return action;
	}
}