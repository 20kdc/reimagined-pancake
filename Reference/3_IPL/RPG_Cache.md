# module RPG::Cache IPL

This module contains a cache for Bitmaps to reduce duplication.

It also contains convenience functions to get particular images or variants of them.

## function load\_bitmap(base String, file String, hue = 0) -> Bitmap

Loads the bitmap at base + file (with or without extension), or reuses the object from cache.

This bitmap can have a hue change applied - this hue change is cached separately.

Do not dispose of resulting bitmaps, as they are shared objects.

If file is equal to `""`, then no file is actually ever loaded - instead, a 32x32 placeholder bitmap is created.

This placeholder is still a shared object.

*No Chapter*


## function tile(tsname String, tile\_id Fixnum, hue Fixnum) -> Bitmap

Retrieves/Creates a 32x32 sprite out of a {RPG::Cache.tileset} name, a tile ID, and a hue.

As per usual, don't dispose of the bitmap, it's cached.

This is a method of implementing tile-event rendering.

*No Chapter*


## function clear() -> nil

This clears the cache, then runs `GC.start` to try and dispose bitmaps that aren't still in use.

*No Chapter*


## function tileset(name String) -> Bitmap

Equivalent to {RPG::Cache.load\_bitmap} with: `("Graphics/Tilesets/", name)`.

*No Chapter*


## function autotile(name String) -> Bitmap

Equivalent to {RPG::Cache.load\_bitmap} with: `("Graphics/Autotiles/", name)`.

*No Chapter*


## function character(name String, hue Fixnum) -> Bitmap

Equivalent to {RPG::Cache.load\_bitmap} with: `("Graphics/Characters/", name, hue)`.

*No Chapter*


## function panorama(name String, hue Fixnum) -> Bitmap

Equivalent to {RPG::Cache.load\_bitmap} with: `("Graphics/Panoramas/", name, hue)`.

*No Chapter*


## function fog(name String, hue Fixnum) -> Bitmap

Equivalent to {RPG::Cache.load\_bitmap} with: `("Graphics/Fogs/", name, hue)`.

*No Chapter*


## function windowskin(name String) -> Bitmap

Equivalent to {RPG::Cache.load\_bitmap} with: `("Graphics/Windowskins/", name)`.

*No Chapter*


## function picture(name String) -> Bitmap

Equivalent to {RPG::Cache.load\_bitmap} with: `("Graphics/Pictures/", name)`.

*No Chapter*


## function battler(name String, hue Fixnum) -> Bitmap

Equivalent to {RPG::Cache.load\_bitmap} with: `("Graphics/Battlers/", name, hue)`.

*No Chapter*


## function animation(name String, hue Fixnum) -> Bitmap

Equivalent to {RPG::Cache.load\_bitmap} with: `("Graphics/Animations/", name, hue)`.

Note, however, that {RPG::Sprite} will dispose of these automatically and unexpectedly.

*No Chapter*


## function title(name String) -> Bitmap

Equivalent to {RPG::Cache.load\_bitmap} with: `("Graphics/Titles/", name)`.

*No Chapter*


## function gameover(name String) -> Bitmap

Equivalent to {RPG::Cache.load\_bitmap} with: `("Graphics/Gameovers/", name)`.

*No Chapter*


## function icon(name String) -> Bitmap

Equivalent to {RPG::Cache.load\_bitmap} with: `("Graphics/Icons/", name)`.

*No Chapter*


## function battleback(name String) -> Bitmap

Equivalent to {RPG::Cache.load\_bitmap} with: `("Graphics/Battlebacks/", name)`.

*No Chapter*

