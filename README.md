[![Project logo](https://github.com/Tw1ddle/needs-ai-lib/blob/master/screenshots/logo.png?raw=true "Needs AI library project logo")](https://github.com/Tw1ddle/needs-ai-lib/)

[![Travis Build Status](https://img.shields.io/travis/Tw1ddle/needs-ai-lib.svg?style=flat-square)](https://travis-ci.org/Tw1ddle/needs-ai-lib)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](https://github.com/Tw1ddle/needs-ai-lib/blob/master/LICENSE)

WORK IN PROGRESS

Needs AI is a utility-based AI library written in Haxe. Run the demo [here](https://tw1ddle.github.io/needs-ai/index.html). Read the documentation [here](http://tw1ddle.github.io/needs-ai-lib/index.html).

# Features
 * Response curves. Linear, polynomial, sine, normal, logit, logistic and more.
 * Customize your own response curves, consideration/action/action set scoring strategies.

# Usage
See the [demo code](https://github.com/Tw1ddle/needs-ai) for a usage example. The overall design is as follows: agents take cues from their ''Brain''s, whose ''Reasoners''
evaluate their ''ActionSets'', in order to select a suitable ''Action'' for the current situation, by weighing up ''Considerations'' based on ''Inputs'' that reflect the state of the game world.

![Class diagram of Needs AI package](https://tw1ddle.github.io/needs-ai-lib/uml/needs.ai.png)

## References
Some links that provide background about utility-based AI:

* [https://dinodini.wordpress.com/2010/04/05/normalized-tunable-sigmoid-functions/](https://dinodini.wordpress.com/2010/04/05/normalized-tunable-sigmoid-functions/)
* [http://www.gdcvault.com/play/1012410/Improving-AI-Decision-Modeling-Through](http://www.gdcvault.com/play/1012410/Improving-AI-Decision-Modeling-Through)
* [http://www.gdcvault.com/play/1021848/Building-a-Better-Centaur-AI](http://www.gdcvault.com/play/1021848/Building-a-Better-Centaur-AI)
* [http://www.gdcvault.com/play/1018040/Architecture-Tricks-Managing-Behaviors-in](http://www.gdcvault.com/play/1018040/Architecture-Tricks-Managing-Behaviors-in)
* [http://www.tenpn.com/df-v1.3/tutorial.html](http://www.tenpn.com/df-v1.3/tutorial.html)
* [http://www.gameaipro.com/GameAIPro2/GameAIPro2_Chapter03_Dual-Utility_Reasoning.pdf](http://www.gameaipro.com/GameAIPro2/GameAIPro2_Chapter03_Dual-Utility_Reasoning.pdf)
* [https://www.amazon.co.uk/Behavioral-Mathematics-Game-Dave-Mark/dp/1584506849](https://www.amazon.co.uk/Behavioral-Mathematics-Game-Dave-Mark/dp/1584506849)
* [https://www.gamedev.net/forums/topic/686840-help-me-understand-utility-ai/](https://www.gamedev.net/forums/topic/686840-help-me-understand-utility-ai/)
* [http://intrinsicalgorithm.com/IAonAI/2009/10/aiide-2009-ai-challenges-in-sims-3-richard-evans/](http://intrinsicalgorithm.com/IAonAI/2009/10/aiide-2009-ai-challenges-in-sims-3-richard-evans/)
* [https://alastaira.wordpress.com/2013/01/25/at-a-glance-functions-for-modelling-utility-based-game-ai/](https://alastaira.wordpress.com/2013/01/25/at-a-glance-functions-for-modelling-utility-based-game-ai/)
* [http://www.gameaipro.com/GameAIPro/GameAIPro_Chapter09_An_Introduction_to_Utility_Theory.pdf](http://www.gameaipro.com/GameAIPro/GameAIPro_Chapter09_An_Introduction_to_Utility_Theory.pdf)
* [https://www.youtube.com/watch?v=IyHG-EGuCWk](https://www.youtube.com/watch?v=IyHG-EGuCWk)
* [https://github.com/apoch/curvature](https://github.com/apoch/curvature)
* [https://github.com/prime31/Nez/tree/master/Nez.Portable/AI](https://github.com/prime31/Nez/tree/master/Nez.Portable/AI)
* [https://www.youtube.com/watch?v=IyHG-EGuCWk](https://www.youtube.com/watch?v=IyHG-EGuCWk)
* [https://github.com/apoch/curvature/wiki/Utility-Theory-Crash-Course](https://github.com/apoch/curvature/wiki/Utility-Theory-Crash-Course)


## Notes
* This haxelib supports all Haxe targets.
* If you have any questions or suggestions then [get in touch](https://twitter.com/Sam_Twidale) or open an issue.