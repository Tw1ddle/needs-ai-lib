package needs.util;

// Extension methods for Arrays
class ArrayExtensions {
	inline public static function randomElement<T>(array:Array<T>):Null<T> {
		return array[Std.random(array.length)];
	}
}