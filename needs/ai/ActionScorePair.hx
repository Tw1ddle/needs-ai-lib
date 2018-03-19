package needs.ai;

import needs.ai.Action;

/**
   Pair type for conveniently returning an action and its utility score from scoring functions.
**/
typedef ActionScorePair<ActionIdType, ConsiderationIdType, InputIdType> = {
	action:Action<ActionIdType, ConsiderationIdType, InputIdType>,
	score:Float
};