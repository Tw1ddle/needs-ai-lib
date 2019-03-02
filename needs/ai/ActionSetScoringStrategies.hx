package needs.ai;

/**
   The ActionSetScoringStrategies class contains boilerplate methods for determining the relative utility of ActionSets.
   These scoring strategies are typically used to rank particular ActionSets to put some groups of Actions ahead of others.
**/
class ActionSetScoringStrategies 
{
	/**
	   Passthrough method that takes some ActionSets and doesn't do anything to rank them by utility.
	   @return	The ActionSets that were provided.
	**/
	public static function passthroughScoringStrategy<ReasonerIdType, ActionSetIdType, ActionIdType, ConsiderationIdType, InputIdType>(reasoner:Reasoner<ReasonerIdType, ActionSetIdType, ActionIdType, ConsiderationIdType, InputIdType>):Array<ActionSetScorePair<ActionSetIdType, ActionIdType, ConsiderationIdType, InputIdType>> {
		var sets = [];
		for (set in reasoner.actionSets) {
			sets.push({ actionSet: set, score: 1.0 });
		}
		return sets;
	}
}