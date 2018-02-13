package needs.ai;

typedef Effect = {
	var id:Int;
	var effect:Dynamic->Void; // Effect accepts data that it acts on e.g. the game world
}

class Action {
	public var id(default, null):Int;
	public var duration(default, null):Float;
	public var effects(default, null):Array<Effect>;
	
	public function new(id:Int, duration:Float, effects:Array<Effect>) {
		this.id = id;
		this.duration = duration;
		this.effects = effects;
	}
}