# class Sprite

A viewport element representing an image on-screen.

## static function new(viewport = nil) -> Sprite

Creates a new Sprite.

*Chapter 2*


## getset bitmap = Bitmap

The image displayed by this sprite.

*Chapter 2*


## getset src\_rect = Rect

The part of the bitmap to use. Set this to {Bitmap.rect} to display the whole image.

*Chapter 2*


## getset ox = Fixnum

The X origin for rotation, but also probably moves the sprite left. Defaults to 0.

*No Chapter*


## getset oy = Fixnum

The Y origin for rotation, but also probably moves the sprite up. Defaults to 0.

*Chapter 5*


## getset zoom\_x = Float

Zoom X, where 1.0 is unmodified. Defaults to 1.0.

*Chapter 5*


## getset zoom\_y = Float

Zoom Y, where 1.0 is unmodified. Defaults to 1.0.

*No Chapter*


## getset angle = Float

Rotation of the sprite, in degrees.

*No Chapter*


## getset mirror = Boolean

Flips the sprite horizontally.

*No Chapter*


## getset bush\_depth = Fixnum

The amount of pixels on the lower part of the source image that are effectively half-transparent.

*No Chapter*


## getset opacity = Fixnum

Opacity, from 0 to 255. Defaults to 255.

*No Chapter*


## getset blend\_type = Fixnum

The way this plane is composited into the scene. Defaults to a typical blending operation.

Blend types are described near the top of the reference.

*No Chapter*


## getset color = Color

A colour to multiply the contents of this Sprite with. Defaults to no modification.

*No Chapter*


## getset tone = Tone

A tone to transform the contents of this Sprite with.

*No Chapter*


## function flash(c Color, duration Fixnum) -> nil

Flashes this sprite with a given colour over a given time (in frames).

If the colour is nil, this has an uncertain effect.

*No Chapter*


## function update() -> nil

Update the flash status of this sprite.

*No Chapter*


## getset viewport = Viewport

The viewport of this viewport element. Nil means that this is displayed on the primary viewport.

*No Chapter*


## getset z = Fixnum

The Z layer of this viewport element. Higher Z means closer to the screen.

*Chapter 2*


## function dispose() -> nil

Dispose of this object. The object then becomes unusable and invisible.

*Chapter 1*


## function disposed?() -> Boolean

Has this object been disposed?

*No Chapter*
