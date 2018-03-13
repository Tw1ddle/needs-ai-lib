package needs.responses;

/**
   Typedef for the Response function type. A response function takes a value (typically normalized into the range 0-1)
   and returns a transformation of that value, typically also clamped to the range 0-1. These functions are used to calculate
   a utility score for a Consideration by processing the value of an Input, which usually originates in the game world.
   This is response curves in the sense of Bob Alexander in AI Game Programming Wisdom - The Beauty of Response Curves,
   not a "Best Response" curve in game theory.
**/
typedef Response = Float->Float;