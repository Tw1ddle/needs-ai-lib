package needs.responses;

/**
   Typedef for a response function type. A response function takes a value (typically normalized into the range 0-1)
   and returns a transformation of that value, typically also clamped to the range 0-1. Response functions are used to
   calculate a utility score for a Consideration by processing the value of an Input, which usually originates in the game world.
**/
typedef Response = Float->Float;