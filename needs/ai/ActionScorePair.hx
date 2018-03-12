package needs.ai;

import needs.ai.Action;

typedef ActionScorePair<ActionIdType, ConsiderationIdType, InputIdType> = {
	action:Action<ActionIdType, ConsiderationIdType, InputIdType>,
	score:Float
};