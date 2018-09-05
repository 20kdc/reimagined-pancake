# class RPG::Weather IPL

This class provides utility functions relating to weather control.

Weather acts at Z 1000.

## static function new(v Viewport) -> Weather

Creates and sets up a Weather object.

*No Chapter*


## function dispose() -> nil

Deletes the weather.

*No Chapter*


## getset type = Fixnum

Changes the weather:

  + 0: None
  + 1: rain
  + 2: storm
  + 3: snow

*No Chapter*


## getset ox = Fixnum

Camera position used for the weather. Defaults to 0.

*No Chapter*


## getset oy = Fixnum

Camera position used for the weather. Defaults to 0.

*No Chapter*


## getset max = Fixnum

The amount of sprites onscreen (from 0 to 40). Defaults to 0.

*No Chapter*

