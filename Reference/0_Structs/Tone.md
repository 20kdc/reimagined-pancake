# class Tone

A Tone defines how to perform colour changes such as "boost red, desaturate other colours".

It is defined by four floats - red, green, blue, and `gray` (or at least, that's the property name).

A tone that alters nothing has these values set to

## TODO TODO TODO UNKNOWN DEFAULTS AND RANGES

## static function new(x Float, y Float, w Float, h Float) -> Tone

Creates a Tone from a given set of values.

*No Chapter*


## function set(x Float, y Float, w Float, h Float) -> nil

Changes all 4 of this Tone's values at the same time.

*No Chapter*


## function \=\=(other ?) -> Boolean

Is this equal to another value (which should be a Tone)?

*No Chapter*


## function \=\=\=(other ?) -> Boolean

See {Tone.\=\=}.

*No Chapter*


## function eql?(other ?) -> Boolean

See {Tone.\=\=}.

*No Chapter*


## getset red = Float

The red adjustment of the Tone. Typically between UNKNOWN and UNKNOWN - UNKNOWN means no change.

*No Chapter*


## getset green = Float

The green adjustment of the Tone. Typically between UNKNOWN and UNKNOWN - UNKNOWN means no change.

*No Chapter*


## getset blue = Float

The blue adjustment of the Tone. Typically between UNKNOWN and UNKNOWN - UNKNOWN means no change.

*No Chapter*


## getset gray = Float

The gray adjustment of the Tone. Typically between UNKNOWN and UNKNOWN - UNKNOWN means no change.

*No Chapter*

