[![Project logo](https://github.com/Tw1ddle/needs-ai-lib/blob/master/screenshots/logo.png?raw=true "Needs AI library project logo")](https://github.com/Tw1ddle/needs-ai-lib/)

[![Travis Build Status](https://img.shields.io/travis/Tw1ddle/needs-ai-lib.svg?style=flat-square)](https://travis-ci.org/Tw1ddle/needs-ai-lib)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](https://github.com/Tw1ddle/needs-ai-lib/blob/master/LICENSE)

Needs AI is a utility-based AI written in Haxe. Run the [web demo](http://tw1ddle.github.io/needs-ai/index.html) here.

Utility-based AI is useful for games where semi-autonomous agents have to satisfy several competing needs, like The Sims.

## How It Works

An agent is modelled as a set of needs, a set of actions, and a strategy that executes actions to meet the needs. Agents continually evaluate the relative urgency of their needs.

Threshold values are used to make the agent repeat actions to satisfy a need, when a single action might not be sufficient.

Modifiers are used to change the effectiveness of needs or actions, to model "personality" traits.

## Notes
* This haxelib supports all Haxe targets.
* If you have any questions or suggestions then [get in touch](https://twitter.com/Sam_Twidale) or open an issue.