# Needs AI Dox

Documentation generation for [Needs AI](https://github.com/Tw1ddle/needs-ai-lib).

This project generates the Needs AI documentation using [dox](https://github.com/HaxeFoundation/dox), the Haxe documentation generator.

It also generates UML diagrams using [HaxeUmlGen](https://github.com/ianxm/haxeumlgen), a class diagram generator for Haxe projects.

## Usage

Run ```generate_docs.bat``` and open ```index.html``` under the ```generated_docs``` folder to see the generated documentation.

## Notes
When bumping the library version number, remember to update the ```--version``` parameter in ```generate_docs.bat``` to match.