package needs.ai;

class Reasoner {
	private var intentSets:Array<OptionBucket>; // TODO sort by weights/queue
	
	// TODO record last chosen intent?
	
	public var onIntentChanged:Reasoner->Option->Option;
	
	public function new() {
		
	}
	
	public function update():Option {
		for (set in intentSets) {
			set.score();
		}
		
		return null; // TODO
	}
}