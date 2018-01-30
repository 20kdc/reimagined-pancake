# class Viewport

## static function new(rect Rect) -> Viewport

Creates a new Viewport.

*Chapter 5*


## getset rect = Rect

Where on the screen this viewport is shown.

*Chapter 5*


## getset ox = Fixnum

The camera X position within the viewport.

*Chapter 5*


## getset oy = Fixnum

The camera Y position within the viewport.

*Chapter 5*


## getset color = Color

A colour to multiply the contents of this Viewport with. Defaults to no modification.

*No Chapter*


## getset tone = Tone

A tone to transform the contents of this Viewport with.

*No Chapter*


## function flash(c Color, duration Fixnum) -> nil

Flashes this sprite with a given colour over a given time (in frames).

If the colour is nil, this has an uncertain effect.

*No Chapter*


## function update() -> nil

Update the flash status of this sprite.

*No Chapter*


## getset z = Fixnum

The Z layer of this viewport element. Higher Z means closer to the screen.

*No Chapter*


## function dispose() -> nil

Dispose of this object. The object then becomes unusable and invisible.

*Chapter 5*


## function disposed?() -> Boolean

Has this object been disposed?

*No Chapter*
