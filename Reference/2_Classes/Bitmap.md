# class Bitmap

An image, drawable onto other images and to the screen via various elements.

The data inside is 32-bit - it includes R, G, B, and Alpha.

## static function new(width Fixnum, height Fixnum) -> Bitmap

Creates a new, blank (completely transparent) bitmap with the specified size.

*Chapter 5*

## static function new(file String) -> Bitmap

Creates a new bitmap by reading it from a file.

No extension is required, so `Graphics/Autotiles/Magic` is a valid path.

*Chapter 1*


## function clone() -> Bitmap

Creates a new bitmap that is a copy of this bitmap.

*No Chapter*


## function width() -> Fixnum

Returns the width of this bitmap.

*No Chapter*


## function height() -> Fixnum

Returns the height of this bitmap.

*No Chapter*


## function rect() -> Rect

Returns the equivalent of `Rect.new(0, 0, width, height)`.

*No Chapter*


## function blt(x Fixnum, y Fixnum, source Bitmap, source\_rect Rect, opacity = 255) -> Bitmap

Draws a part of another bitmap onto this bitmap at the specified position, with the specified opacity.

`source_rect` should be specified as `source.rect` to simply draw the whole bitmap.

While this function does not clone this bitmap, it returns it, presumably for call-chaining.

*Chapter 5*


## function stretch\_blt(dest\_rect Rect, source Bitmap, source\_rect Rect, opacity = 255) -> Bitmap

Draws a part of another bitmap onto this bitmap at the specified position, with the specified opacity.

While this function does not clone this bitmap, it returns it, presumably for call-chaining.

*Chapter 5*


## function fill\_rect(x Fixnum, y Fixnum, w Fixnum, h Fixnum, colour Color) -> Bitmap

Fills a rectangle on this bitmap with a given colour.

While this function does not clone this bitmap, it returns it, presumably for call-chaining.

*No Chapter*


## function fill\_rect(dest\_rect Rect, colour Color) -> Bitmap

Fills a rectangle on this bitmap with a given colour.

While this function does not clone this bitmap, it returns it, presumably for call-chaining.

*No Chapter*


## function clear() -> Bitmap

Clears this bitmap back to complete transparency, as if made with {Bitmap.new}.

While this function does not clone this bitmap, it returns it, presumably for call-chaining.

*No Chapter*


## function hue\_change(degrees Fixnum) -> Bitmap

Changes the hue of this bitmap by a set amount of degrees.

While this function does not clone this bitmap, it returns it, presumably for call-chaining.

*No Chapter*


## function get\_pixel(x Fixnum, y Fixnum) -> Color

Gets a pixel on this bitmap, and returns the colour.

*No Chapter*


## function set\_pixel(x Fixnum, y Fixnum, colour Color) -> Bitmap

Sets a pixel on this bitmap.

While this function does not clone this bitmap, it returns it, presumably for call-chaining.

*No Chapter*


## function draw\_text(x Fixnum, y Fixnum, w Fixnum, h Fixnum, text String, align = 0) -> Bitmap

Draws a piece of text onto this bitmap with the current font.

Alignment can be 0 for left, 1 for middle, or 2 for right.

While this function does not clone this bitmap, it returns it, presumably for call-chaining.

*No Chapter*


## function draw\_text(bounds Rect, text String, align = 0) -> Bitmap

Draws a piece of text onto this bitmap with the current font.

Alignment can be 0 for left, 1 for middle, or 2 for right.

While this function does not clone this bitmap, it returns it, presumably for call-chaining.

*No Chapter*


## function text\_size(text String) -> Rect

Returns the size of a given piece of text drawn with the current font.

*No Chapter*


## getset font = Font

The font used for drawing text.

*No Chapter*
