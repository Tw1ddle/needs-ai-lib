package needs.util;

#if macro

import needs.util.FileReader;
import sys.FileSystem;
import haxe.macro.Context;
import haxe.macro.Expr.Access.APublic;
import haxe.macro.Expr.Access.AStatic;
import haxe.macro.Expr.Field;
import haxe.macro.Expr.FieldType.FVar;

using StringTools;

/**
 * Build macro for reading string data at compile time
 */
@:access(needs.util.FileReader)
class StringDataBuilder {
	/**
	 * Reads all the files in a directory, and builds a type full of static arrays of data populated by the files in that directory at compile time.
	 * @param directoryPath   File path to the directory to be scanned.
	 * @return Array of string array fields containing the contents of the files in the directory.
	 */
	public static macro function build(directoryPath:String):Array<Field> {
		var fields = Context.getBuildFields();
		
		var splitter = new EReg("[\r\n]", "g");
		
		try {
			var files = FileSystem.readDirectory(directoryPath);
			for (i in 0...files.length) {
				var data = FileReader.loadFileAsString(directoryPath + "/" + files[i]);
				
				var file = files[i];
				
				// Take a filename, replace spaces with underscores, remove the extension and ensure it only contains characters a-zA-Z0-9
				var name = file.split(".")[0].replace(" ", "_");
				var sanitizer = new EReg("^[a-zA-Z0-9_]*$", "i");
				
				if (!sanitizer.match(name)) {
					throw "Training data files must have alphanumeric names";
				}
				
				var words = splitter.split(data).filter(function(s:String) { return (s != "\r" && s != "\n" && s != "\r\n" && s != ""); });

				var field = {
					name: name,
					doc: file,
					meta: [],
					access: [APublic, AStatic],
					kind: FVar(macro:Array<String>, macro $v{words}),
					pos: Context.currentPos()
				};
				
				fields.push(field);
			}
		} catch (e:Dynamic) {
			Context.error('Failed to find directory $directoryPath: $e', Context.currentPos());
		}
		
		return fields;
	}
}

#end