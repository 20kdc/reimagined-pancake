# class Color

A Color is generally multiplied onto existing images for various reasons. (flashes, constant colour multipliers, etc.)

It is defined by four floats - red, green, blue, and alpha.

A Color that alters nothing has these values set to 255, 255, 255 and 255.

## static function new(red Float, green Float, blue Float, alpha = 255.0) -> Color

Creates a Color from a given set of values.

*No Chapter*


## function set(red Float, green Float, blue Float, alpha = 255.0) -> nil

Changes all 4 of this Color's values at the same time.

*No Chapter*


## function ==(other ?) -> Boolean

Is this equal to another value (which should be a Color)?

*No Chapter*


## function ===(other ?) -> Boolean

See {Color.==}.

*No Chapter*


## function eql?(other ?) -> Boolean

See {Color.==}.

*No Chapter*


## getset red = Float

The red of the Color. Between 0 and 255, inclusive.

*No Chapter*


## getset green = Float

The green of the Color. Between 0 and 255, inclusive.

*No Chapter*


## getset blue = Float

The blue of the Color. Between 0 and 255, inclusive.

*No Chapter*


## getset alpha = Float

The alpha of the Color. Between 0 and 255, inclusive.

*No Chapter*

