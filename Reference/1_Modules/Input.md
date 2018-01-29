# module Input

Used to read the keyboard (and, in MKXP, the mouse).

'Key' here can be an integer internal key code, or a symbol.

A list of symbols, the key codes they map to, and their default buttons:

  + `Input::LEFT` : 4, Left arrow key
  + `Input::UP` : 8, Up arrow key
  + `Input::RIGHT` : 6, Right arrow key
  + `Input::DOWN` : 2, Down arrow key
  + `Input::A` : 11, Left-Shift/Z
  + `Input::B` : 12, Escape/Keypad 0/X
  + `Input::C` : 13, Space/Enter/C
  + `Input::X` : 14, A
  + `Input::Y` : 15, S
  + `Input::Z` : 16, D
  + `Input::L` : 17, Q
  + `Input::R` : 18, W
  + `Input::SHIFT` : 21, Shift
  + `Input::CTRL` : 22, Control
  + `Input::ALT` : 23, Alt
  + `Input::F5` : 25, F5
  + `Input::F6` : 26, F6
  + `Input::F7` : 27, F7
  + `Input::F8` : 28, F8
  + `Input::F9` : 29, F9
  + `Input::MOUSELEFT` : 38, (Non-standard MKXP extension to replace missing Windows API functionality)
  + `Input::MOUSEMIDDLE` : 39, (Non-standard MKXP extension to replace missing Windows API functionality)
  + `Input::MOUSERIGHT` : 40, (Non-standard MKXP extension to replace missing Windows API functionality)

Directions ({Input.dir4} and {Input.dir8}) are best memorized with:

   789
   4 6
   123

## function update() -> nil

Updates the keys.

*Chapter 2*


## function press?(x Key) -> Boolean

Updates the keys.

*Chapter 2*


## function trigger?(x Key) -> Boolean

Updates the keys.

*Chapter 2*


## function repeat?(x Key) -> Boolean

Returns if `trigger?`

*No Chapter*


## function dir4(x Key) -> Fixnum

Returns the current cardinal direction, inputted with the arrow keys.

*No Chapter*


## function dir8(x Key) -> Fixnum

Returns the current 8-direction value, including cardinals and diagonals, as inputted with the arrow keys.

*Chapter 2*


## function mouse\_x() -> Fixnum MKXP

Get the mouse's Y position within the window.

This is a replacement for Windows API functionality.

*No Chapter*


## function mouse\_y() -> Fixnum MKXP

Get the mouse's Y position within the window.

This is a replacement for Windows API functionality.

*No Chapter*

