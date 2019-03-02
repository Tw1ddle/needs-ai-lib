package needs.util;

/**
  Helper function for creating instance ids for objects used by the library
**/
class InstanceId 
{
	private static var instanceId:Int = 0;
	
	public static inline function makeId():Int {
		return instanceId++;
	}
}