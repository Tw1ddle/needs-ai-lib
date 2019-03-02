package needs.ai;

import needs.ai.Action;

/**
   Pair type for conveniently returning an action set and its utility score from scoring functions.
**/
typedef ActionSetScorePair<ActionSetIdType, ActionIdType, ConsiderationIdType, InputIdType> = {
	actionSet:ActionSet<ActionSetIdType, ActionIdType, ConsiderationIdType, InputIdType>,
	score:Float
};