package needs.ai;

class Intent {
	private var name:String;
	private var considerations:Array<Consideration>;
	
	public function new() {
		
	}
	
	public function score(dt:Float):Float {
		if (considerations.length == 0) {
			return 0.0;
		}

		var score:Float = 1.0;
		for (consideration in considerations) {
			score *= consideration.score();
		}
		return score;
	}
}