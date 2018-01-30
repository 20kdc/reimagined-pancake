# class Plane

A viewport element representing an infinitely tiled image.

## static function new(viewport = nil) -> Plane

Creates a new Plane.

*Chapter 1*


## getset bitmap = Bitmap

The image displayed by this plane.

*Chapter 1*


## getset ox = Fixnum

Essentially a "X camera position" field, increasing this shifts the plane to the left.

*No Chapter*


## getset oy = Fixnum

Essentially a "Y camera position" field, increasing this shifts the plane to the top.

*No Chapter*


## getset zoom\_x = Float

Zoom X, where 1.0 is unmodified. Defaults to 1.0.

*No Chapter*


## getset zoom\_y = Float

Zoom Y, where 1.0 is unmodified. Defaults to 1.0.

*No Chapter*


## getset opacity = Fixnum

Opacity, from 0 to 255. Defaults to 255.

*No Chapter*


## getset blend\_type = Fixnum

The way this plane is composited into the scene. Defaults to a typical blending operation.

Blend types are described near the top of the reference.

*No Chapter*


## getset color = Color

A colour to multiply the contents of this Plane with. Defaults to no modification.

*No Chapter*


## getset tone = Tone

A tone to transform the contents of this Plane with.

*No Chapter*


## getset viewport = Viewport

The viewport of this viewport element. Nil means that this is displayed on the primary viewport.

*No Chapter*


## getset z = Fixnum

The Z layer of this viewport element. Higher Z means closer to the screen.

*No Chapter*


## function dispose() -> nil

Dispose of this object. The object then becomes unusable and invisible.

*Chapter 1*


## function disposed?() -> Boolean

Has this object been disposed?

*No Chapter*
