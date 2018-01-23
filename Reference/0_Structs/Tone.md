# class Tone

A Tone defines how to perform colour changes such as "boost red, desaturate other colours".

It is defined by four floats - red, green, blue, and `gray` (or at least, that's the property name).

The maths, according to https://github.com/Ancurio/mkxp/blob/master/shader/plane.frag#L20 :

The input pixel is lerped to a greyscale copy (with greyscale being defined via what appears to be the HSP model), weighed by gray.

Then the RGB adjustment is added.

## static function new(red Float, green Float, blue Float, gray = 0.0) -> Tone

Creates a Tone from a given set of values.

*No Chapter*


## function set(red Float, green Float, blue Float, gray = 0.0) -> nil

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

The red adjustment of the Tone. 0 means no change. Can be from -255 to 255.

*No Chapter*


## getset green = Float

The green adjustment of the Tone. 0 means no change. Can be from -255 to 255.

*No Chapter*


## getset blue = Float

The blue adjustment of the Tone. 0 means no change. Can be from -255 to 255.

*No Chapter*


## getset gray = Float

The gray weight of the Tone. 0 means full colour, 255 means completely desaturated.

*No Chapter*

