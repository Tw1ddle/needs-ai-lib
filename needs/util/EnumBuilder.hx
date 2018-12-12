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

// TODO

/**
 * Build macro for building enums at compile time
 */
@:access(needs.util.FileReader)
class EnumBuilder {
	/**
	 * Reads all the files in a directory, and builds an enum based on the given file or files in that directory at compile time.
	 * @param path   File path to the file or directory to be scanned.
	 * @return Array of fields, one per line from each file scanned.
	 */
	public static macro function build(path:String):Array<Field> {
		var fields = Context.getBuildFields();
		
		var lineSplitter = new EReg("[\r\n|\r|\n]", "i");
		var fileNameSanitizer = new EReg("^[a-zA-Z0-9_]*$", "i");
		var lineSanitizer = new EReg("[^a-zA-Z0-9]", "g");
		
		try {
			var files:Array<String> = FileSystem.readDirectory(path);
			
			for (file in files) {
				var data:String = FileReader.loadFileAsString(path + "/" + file);
				
				var name = file.split(".")[0].replace(" ", "_");
				
				if (!fileNameSanitizer.match(name)) {
					throw "Data files must have alphanumeric names";
				}
				
				var lines:Array<String> = lineSplitter.split(data);
				
				lines = Lambda.array(Lambda.filter(lines, (l)-> { return l.length != 0; }));
				
				for (line in lines) {
					var sanitizedLine = line.replace(" ", "_");
					sanitizedLine = lineSanitizer.replace(line, "_");
					sanitizedLine = sanitizedLine.toLowerCase();
					
					trace(sanitizedLine);
					
					var field = {
						name: sanitizedLine,
						doc: null,
						meta: [],
						access: [],
						kind: FVar(null, null),
						pos: Context.currentPos()
					};
					
					fields.push(field);
				}
			}
		} catch (e:Dynamic) {
			Context.error('Failed to find directory $path: $e', Context.currentPos());
		}
		
		return fields;
	}
}

#end
