# reimagined-pancake - Code as documentation on RGSS1 (RPG Maker XP)
# Written starting in 2018 by contributors (see CREDITS.md)
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

##
# # Chapter 3. Tilemaps (Plural) - or, how I learned to stop worrying and love the tilemaps.

# RPG Maker XP only ever uses one tilemap at a time, with one tileset at a time.
#
# This is known fact. You would *assume* that this fact exists down to the graphics engine level.
# ...It doesn't.
#
# In fact, a tilemap in RGSS is almost like any other viewport element.
# It is also the most variable between RGSS versions.
#
# In most areas, RGSS versions are extensions. In this case, "TilemapVX" (as it's known by mkxp) replaces Tilemap entirely.
#
# To put it simply, a Tilemap is like a Plane in most ways.
#
# This makes sense, given that both scroll infinitely.
#
# That said, Tilemaps don't have a Z, but they do have a viewport.
#
# + `class Tilemap`
#   + `Tilemap.new(viewport = nil) -> Tilemap` : You know the drill.
#   + `t.viewport = Viewport` : While this has no Z control, it can still be locked to a viewport.
#   + `t.tileset = Bitmap` : This is a Bitmap, containing the contents of what *would* be: Graphics/Tilesets/tileset.png - set it accordingly.
#   + `t.autotiles = [7] of Bitmap` : Not, in fact, an Array. AT1 through AT7 are at 0 through 6. Make sure none of these are nil to prevent a crash.
#   + `t.map_data = Table[W, H, 3]` : This is the @data table from the Map.
#   + `t.flash_data = Table[W, H, 1]` : RGB444 table for making specific X/Y positions flash. Probably don't leave as nil.
#   + `t.priorities = Table[1632]` : This is the @priorities table from the relevant RPG Maker XP object.
#   + `t.visible = Boolean` : The usual visibility on/off.
#   + `t.ox = Fixnum` / `t.oy = Fixnum` : As with Plane, effectively a top-left camera position. Increase OX, map goes left - increse OY, map goes up.
#   + `t.update() -> nil` : This probably updates flash data.
#   + `t.dispose() -> nil` : Dispose the object - makes it unusable.
#   + `t.disposed?() -> Boolean` : Has this been disposed yet?
#
# Regarding how Z works and interacts with multiple Tilemap objects (this is all extrapolation from MKXP code):
#
# Priorities > 5 are considered invalid by MKXP.
#
# Priority 0 tiles are drawn at absolute Z 0.
#
# Other priority values are drawn on a "ZLayer", with the index Y (in tile coords) + priority.
#
# This index is converted into absolute Z with a formula I don't quite understand,
#  but seems to result in the tile's Y position from the top of the screen?

ts = load_data("Data/Tilesets.rxdata")[1]

# Uses RPG::Cache.tileset and RPG::Cache.autotile to load the tileset into a Tilemap.

def apply_tileset(tilemap, ts)
 tilemap.tileset = RPG::Cache.tileset(ts.tileset_name)
 ts.autotile_names.each_with_index do | str, idx |
  tilemap.autotiles[idx] = RPG::Cache.autotile(str)
 end
 tilemap.priorities = ts.priorities
end

# Load and display 3 maps, with the same tileset.
#
# The order of creation is important, due to the way Z is handled.
#
# For a proper XP map renderer, you would take the map's tileset ID into consideration.

a = Tilemap.new()
apply_tileset(a, ts)
a.map_data = load_data("Data/Map001.rxdata").data
a.flash_data = Table.new(a.map_data.xsize, a.map_data.ysize, 1)
a.update

b = Tilemap.new()
apply_tileset(b, ts)
b.map_data = load_data("Data/Map002.rxdata").data
b.flash_data = Table.new(b.map_data.xsize, b.map_data.ysize, 1)
b.update

c = Tilemap.new()
apply_tileset(c, ts)
c.map_data = load_data("Data/Map003.rxdata").data
c.flash_data = Table.new(c.map_data.xsize, c.map_data.ysize, 1)
c.update

# Now the fun part is over, we just setup a main render loop that updates everything.

Input.update
while not Input.trigger?(Input::A)
 a.ox = Graphics.frame_count * 2
 b.ox = Graphics.frame_count * 3
 c.ox = Graphics.frame_count * 4
 a.update
 b.update
 c.update
 Graphics.update
 Input.update
end

# As per usual, involved objects are disposed of, and graphics are frozen for the menu.

Graphics.freeze()
a.dispose()
b.dispose()
c.dispose()
RPG::Cache.clear()
