# class Tilemap

One of the most critical rendering objects in RGSS1, almost all map rendering relies on this to make up most of the world.

It's the bread-and-butter of RGSS1's rendering framework.

Tilemap objects have no 'z', but do still have a 'viewport'.

Regarding how Z works and interacts with multiple Tilemap objects (this is all extrapolation from MKXP code):

Priorities > 5 are considered invalid by MKXP.

Priority 0 tiles are drawn at absolute Z 0.

Other priority values are drawn on a "ZLayer", with the index Y (in tile coords) + priority.

This index is converted into absolute Z with a formula I don't quite understand,
 but seems to result in the tile's Y position from the top of the screen?

(Events are placed using a similar, but not quite the same, system -
  a particular note is that an event above 32 pixels in height gets 31 added to it's Z.
 That said, treating the systems as equivalent otherwise is very much an approximation due to a lack of understanding on my part.)

Regarding how general tile structure works, it's rather simple.

It starts out with 8 blocks with 48 tiles in each block.

These are the "null" Autotile layer, and the 7 proper Autotile layers.

Tile ID 384 and onwards is simply an index into the `Graphics/Tilesets/` map. 256 wide, nothing much to see here.

There appears to be a limit in the official RPG Maker XP software of tile IDs being limited from 0 to 1631.

That said, I only know of this limit from observation of it's output, and thus it may not be reliable.

Regarding the 48 autotiles, each autotile image can be divided into 96x128 animation frames,
 each looking like this:

    A | |B
    --+-+--
    UL|U|UR
    --+-+--
    L |C|R
    --+-+--
    LL|D|LR

Each tile of this animation frame is by itself split into 4 corner 'subtiles'.
The final 48 tiles are compiled out of sets of 4 corner subtiles.

Each output corner subtile is only ever gotten from that corner.
An upper-left subtile may come from the upper-left of B, but never from the lower-right of UL.

The mappings from the 48 IDs to their 4 subtile corners are available in [R48's RXP/AutoTiles.txt](https://github.com/20kdc/gabien-app-r48/blob/master/src/main/resources/assets/RXP/AutoTiles.txt) file.

Thanks to Ancurio for alerting me to the errors that were in this in pre-release versions, and giving me a reference chart I used to compare MKXP and R48.

Regarding animation, I don't know the exact details of how animation works at this time.

## TODO TODO TODO TODO, is it only 1 or 4 frames, or something more? What's the rate?

## static function Tilemap.new(viewport = nil) -> Tilemap

Creates a Tilemap. Critical things to set to prevent crashes on rendering:

  + {Tilemap.autotiles} elements must be non-nil. (They're nil by default.)
  + {Tilemap.tileset} must be non-nil. (It's nil by default.)
  + {Tilemap.map\_data} should be non-nil.
  + {Tilemap.flash\_data} should be non-nil.
  + {Tilemap.priorities} should be non-nil.

*Chapter 3*


## getset viewport = Viewport

The viewport that this tilemap is constrained to.

*Chapter 3*


## getset tileset = Bitmap

The equivalent of the `Graphics/Tilesets/` bitmap.

*Chapter 3*


## function autotiles -> TilemapAutotiles

Returns something similar to, but not quite, an array.

You must set elements 0 through 6 of this to bitmaps for AT1 through AT8 to prevent crashes on some runtimes.

*Chapter 3*


## getset map\_data = Table[W, H, 3]

The {RPG::Map.data} value.

*Chapter 3*


## getset flash\_data = Table[W, H, 1]

RGB444 data for flashes.

*No Chapter*


## getset priorities = Table[1632]

Per-tile-ID priority values.

*Chapter 3*


## getset t.visible = Boolean

Should the Tilemap be visible?

*Chapter 3*


## getset ox = Fixnum

The 'camera X', in pixels.

*Chapter 3*


## getset oy = Fixnum

The 'camera Y', in pixels.

*Chapter 3*


## function update() -> nil

Updates flashes.

*Chapter 3*


## function dispose() -> nil

Dispose of this object. The object then becomes unusable and invisible.

*Chapter 3*


## function disposed?() -> Boolean

Has this object been disposed?
