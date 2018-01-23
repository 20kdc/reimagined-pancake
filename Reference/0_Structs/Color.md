# class Color

A Color is generally multiplied onto existing images for various reasons. (flashes, constant colour multipliers, etc.)

It is defined by four floats - red, green, blue, and alpha.

A Color that alters nothing has these values set to 255, 255, 255 and 255.

## static function new(red Float, green Float, blue Float, alpha = 255.0) -> Color

Creates a Color from a given set of values.

*No Chapter*


## function set() -> nil

Changes all 4 of this Color's values at the same time.

*No Chapter*


## function \=\=(other ?) -> Boolean

Is this equal to another value (which should be a Color)?

*No Chapter*


## function \=\=\=(other ?) -> Boolean

See {Color.\=\=}.

*No Chapter*


## function eql?(other ?) -> Boolean

See {Color.\=\=}.

*No Chapter*


## getset red = Float

The red adjustment of the Color. Typically between UNKNOWN and UNKNOWN - UNKNOWN means no change.

*No Chapter*


## getset green = Float

The green adjustment of the Color. Typically between UNKNOWN and UNKNOWN - UNKNOWN means no change.

*No Chapter*


## getset blue = Float

The blue adjustment of the Color. Typically between UNKNOWN and UNKNOWN - UNKNOWN means no change.

*No Chapter*


## getset gray = Float

The gray adjustment of the Color. Typically between UNKNOWN and UNKNOWN - UNKNOWN means no change.

*No Chapter*

