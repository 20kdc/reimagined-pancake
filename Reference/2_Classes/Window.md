# class Window

A Window is, in essence, a nine-patch-style border around a Bitmap.

They have several benefits, including providing most of a scrolling UI automatically.

## getset windowskin = Bitmap

The image that contains the Window's border, backing, and cursor image.

*No Chapter*


## getset contents = Bitmap

The scrollable image drawn in the centre of the window.

If any boundary of this image exceeds any inner border of the window, the respective arrow is shown.

*No Chapter*


## getset stretch = Boolean

Stretch the Window's back and cursor squares.

*No Chapter*


## getset cursor\_rect = Rect

The Window's cursor rectangle.

*No Chapter*


## getset active = Boolean

Should the Window cursor perform it's usual fade? (Defaults to true.)

*No Chapter*


## getset pause = Boolean

Displays the "advance game" arrow at the bottom of the Window. This fades in when set to true, but disappears when set to false.

*No Chapter*


## getset x = Fixnum

The X position of the left edge of the Window as a whole.

*Chapter 6*


## getset y = Fixnum

The Y position of the top edge of the Window as a whole.

*Chapter 6*


## getset width = Fixnum

The width of the Window as a whole, including border.

*Chapter 6*


## getset height = Fixnum

The height of the Window as a whole, including border.

*Chapter 6*


## getset ox = Fixnum

The X scroll position. 0 means the image's left side is aligned with the left side of the inner edge of the window.

*Chapter 6*


## getset oy = Fixnum

The Y scroll position. 0 means the image's top side is aligned with the top side of the inner edge of the window.

*Chapter 6*


## getset opacity = Fixnum

The opacity of this Window as a whole. Defaults to 255.

*No Chapter*


## getset back\_opacity = Fixnum

The opacity of this Window's centre. Defaults to 255.

*No Chapter*


## getset contents\_opacity = Fixnum

The opacity of this Window's contents. Defaults to 255.

*No Chapter*


## getset z = Fixnum

The Z layer of this viewport element. Higher Z means closer to the screen.

*No Chapter*


## function dispose() -> nil

Dispose of this object. The object then becomes unusable and invisible.

*Chapter 6*


## function disposed?() -> Boolean

Has this object been disposed?

*No Chapter*
