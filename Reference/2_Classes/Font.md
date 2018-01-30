# class Font

A Font defines how text is rendered, including font family, size, and attributes such as bold, italic, and underline.

## static function new(name = default\_name, size = default\_size) -> Font

Creates a Font object, optionally with a name and size.

*Chapter 6*


## function clone() -> Font

Creates a clone of the Font object (for deriving a font with, say, italics).

*No Chapter*


## static function exist?(name String) -> Boolean

Does the specified font family exist?

*No Chapter*


## static getset default\_name = String

The default font family when none is specified.

*Chapter 6*


## static getset default\_size = Fixnum

The default size when none is specified.

*No Chapter*


## static getset default\_color = Color

The default colour when none is specified.

*No Chapter*


## static getset default\_bold = Boolean

A default attribute when none is specified.

*No Chapter*


## static getset default\_italic = Boolean

A default attribute when none is specified.

*No Chapter*


## getset name = String

The font family name. Use {Font.exists?} to check if a font family you intend to use exists.

*No Chapter*


## getset size = Fixnum

The font size.

*No Chapter*


## getset color = Color

What colour should the font be drawn with?

*No Chapter*


## getset bold = Boolean

Is this font bold?

*No Chapter*


## getset italic = Boolean

Is this font italic?

*No Chapter*
