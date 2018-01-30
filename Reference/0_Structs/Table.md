# class Table

A Table is a 1-to-3-dimensional array, filled with 16-bit signed integers.

Tables are used for mass data storage.

## static function new(x Fixnum, y = 1, z = 1) -> Table

Creates a Table. The amount of arguments given specifies the dimensions of the Table.

*Chapter 3*


## function clone() -> Table

Creates a copy of this Table.

*No Chapter*


## function xsize() -> Fixnum

Gets the width of the table.

*No Chapter*


## function ysize() -> Fixnum

Gets the height of the table.

*No Chapter*


## function zsize() -> Fixnum

Gets the layer count of the table.

*No Chapter*


## function \[\](x Fixnum, y = 0, z = 0) -> Fixnum

Gets an element of the table.

The dimension count should be the same as the table was created with.

*No Chapter*


## function \[\]=(x Fixnum, \[y Fixnum, \[z Fixnum\]\], value Fixnum) -> Fixnum

Sets an element of the table.

The dimension count should be the same as the table was created with.

Returns the value you gave it.

*No Chapter*


## function resize(x Fixnum, y = 1, z = 1) -> nil

Resizes this Table to the given dimensions.

The dimension count should be the same as the table was created with.

*No Chapter*
