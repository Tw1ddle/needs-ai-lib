package needs.ai;

import needs.ai.Action;

typedef ActionScorePair<ActionIdType, ConsiderationIdType> = {
	action:Action<ActionIdType, ConsiderationIdType>,
	score:Float
};