package needs.ai;

/**
   The WatchedBrain extends the Brain class and keeps track of everything it has ever decided, which is useful for debugging purposes.
**/
class WatchedBrain<BrainIdType, ReasonerIdType, ActionSetIdType, ActionIdType, ConsiderationIdType, InputIdType>
extends Brain<BrainIdType, ReasonerIdType, ActionSetIdType, ActionIdType, ConsiderationIdType, InputIdType> {
	public function new(id:BrainIdType, reasoners:Array<Reasoner<ReasonerIdType, ActionSetIdType, ActionIdType, ConsiderationIdType, InputIdType>>) {
		super(id, reasoners);
	}
}