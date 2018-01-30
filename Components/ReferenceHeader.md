# Summary

The reimagined-pancake reference section is meant to be a more traditional class/module/method/variable reference, like that of the online Ruby documentation.

Some parts of this are actually part of `module_rpg1.rb`.

These are marked with the keyword `IPL`, which you will have seen in the table of contents above.

Good luck writing those replacement scripts.

NOTE: Right now this is incomplete!

# Blend Types

There are 4 known blend types supported by RGSS1.

  + -1: Normal, but doesn't modify the destination alpha.
  + 0: Normal, the default - source Alpha weights an RGB interpolation, then source alpha is added to destination alpha multiplied by inverted source alpha (for some reason).
  + 1: Addition. Adds RGB \* Alpha of source to destination RGB, and adds Alpha of source to destination.
  + 2: Subtraction. Subtracts RGB \* Alpha of source from destination RGB, and subtracts alpha of source from destination.


