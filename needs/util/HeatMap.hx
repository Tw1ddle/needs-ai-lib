package needs.util;

import haxe.io.UInt8Array;

/**
    Grid of unsigned 8-bit values.
 */
class HeatMap 
{
	private var data:UInt8Array;
	public var width(default, null):Int;
	public var height(default, null):Int;
	
	public function new(width:Int, height:Int)
	{
		data = new UInt8Array(width * height);
		this.width = width;
		this.height = height;
	}
	
	public inline function get(x:Int, y:Int):Int {
		return data.get(x + y * width);
	}
	
	public inline function getIdx(idx:Int):Int {
		return data.get(idx);
	}
	
	public inline function set(x:Int, y:Int, v:Int):Void {
		data.set(x + y * width, v);
	}
}