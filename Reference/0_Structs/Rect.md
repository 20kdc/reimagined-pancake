# class Rect

A Rect is a rectangle, defined by position and size.

A Rect, like a {Color} or a {Tone}, is serializable, mutable, clonable, can be stringified, and can be tested for equality with another Rect.

## static function new(x Fixnum, y Fixnum, w Fixnum, h Fixnum) -> Rect

Creates a Rect from a given set of values.

*No Chapter*


## function set(x Fixnum, y Fixnum, w Fixnum, h Fixnum) -> nil

Changes all 4 of this Rect's values at the same time.

*No Chapter*


## function ==(other ?) -> Boolean

Is this equal to another value (which should be a Rect)?

*No Chapter*


## function ===(other ?) -> Boolean

See {Rect.==}.

*No Chapter*


## function eql?(other ?) -> Boolean

See {Rect.==}.

*No Chapter*


## getset x = Fixnum

The X position of the Rect.

*No Chapter*


## getset y = Fixnum

The Y position of the Rect.

*No Chapter*


## getset width = Fixnum

The width of the Rect.

*No Chapter*


## getset height = Fixnum

The height of the Rect.

*No Chapter*

