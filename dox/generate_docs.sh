#!/bin/bash

# This shell script generates the documentation for needs-ai.

# Clean the generated documentation folder, to remove any old documentation.
rm -rf "generated_docs"

# Delete any existing generated XML-format type information.
rm -f types.xml

# Build the XML-format type information.
haxe build.hxml

# Generate the documentation.
haxelib run dox -i types.xml -theme ./themes/samcodes --title "Needs AI API" -D version 1.0.0 --include "(needs)" -o generated_docs

# Generate UML diagrams using HaxeUmlGen
haxelib run HaxeUmlGen dot types.xml

# Copy the generated UML images into the generated_docs folder so they are deployed along with the other dox
mkdir generated_docs/uml
mv -iv -- *.png generated_docs/uml