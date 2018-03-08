package needs.ai;

import needs.util.Signal;

class Reasoner {
	private var intentSets:Array<OptionBucket>; // TODO sort by weights/queue
	
	// TODO record last chosen intent?
	
	public var onIntentChanged:Signal<Reasoner->Option->Option>;
	
	public function new() {
		onIntentChanged = null;
	}
	
	public function update():Option {
		for (set in intentSets) {
			set.score();
		}
		
		return null; // TODO
	}
}