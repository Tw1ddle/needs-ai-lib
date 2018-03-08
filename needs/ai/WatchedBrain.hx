package needs.ai;

/**
   The WatchedBrain extends the Brain class and keeps track of everything it has ever decided, which is useful for debugging purposes.
**/
class WatchedBrain extends Brain {
	public function new(reasoners:Array<Reasoner>) {
		super(reasoners);
	}
}