# reimagined-pancake - Code as documentation on RGSS1 (RPG Maker XP)
# Written starting in 2018 by contributors (see CREDITS.txt)
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# Chapter 3. Tilemaps (Plural) - or, how I learned to stop worrying and love the tilemaps

# RPG Maker XP only ever uses one tilemap at a time, with one tileset at a time.
# This is known fact. You would *assume* that this fact exists down to the graphics engine level.
# ...It doesn't.
# In fact, a tilemap in RGSS is like any other viewport element.
# It is also the most variable between RGSS versions.
# In most areas, RGSS versions are extensions. In this case, "TilemapVX" (as it's known by mkxp) replaces Tilemap entirely.

# To put it simply, a Tilemap is like a Plane in most ways.
# This makes sense, given that both scroll infinitely.
# That said, they ignore Z (see priorities)

# Tilemap.tileset : This is a Bitmap, containing the contents of what *would* be: Graphics/Tilesets/tileset.png - set it accordingly.
# Tilemap.autotiles[0-6] : Autotile images for AT1 through AT7. Make sure none of these are nil to prevent a crash.
# Tilemap.map_data : This is the @data table from the Map.
# Tilemap.flash_data : RGB444 WxHx1 table for making specific X/Y positions flash. Probably don't leave as nil.
# Tilemap.priorities : This is the @priorities table from the relevant RPG Maker XP object.
#                      Regarding how Z works and interacts with multiple Tilemap objects (this is all extrapolation from MKXP code):
#                      The Z of a tilemap is completely ignored.
#                      Priorities > 5 are considered invalid by MKXP.
#                      Priority 0 tiles are drawn at absolute Z 0.
#                      Other priority values are drawn on a "ZLayer", with the index Y (in tile coords) + priority.
#                      This index is converted into aboslute Z with the formula (32 * (index + p->viewpPos.y + 1)) - oy,
#                       I suspect this is linked to tilesize in some way.
# Tilemap.visible : Boolean - is this visible?
# Tilemap.ox / Tilemap.oy : Acts as with Plane.
#  Effectively a top-left camera position. Increase OX, it goes left on-screen, so effective camera goes right.
# Tilemap.update : I suspect that this updates flash data or something - I call it "just in case"

Graphics.freeze()
a = Bitmap.new("Graphics/Tilesets/C3TS.png")
# This is where things get tricky.
# A quick note:
#  load_data(filename) and save_data(filename, data) are how you're supposed to save and load data in RGSS.
# Right now it's being used here to load all the relevant Data/ objects.
# Priorities are loaded out of Tilesets for simplicity, but nothing else.
ns = load_data("Data/Tilesets.rxdata")[1].priorities

# Load and display 3 maps with no autotiles and with just the tileset image loaded above.
# For a proper XP map renderer, you would do more here.
b = Tilemap.new()
b.tileset = a
# Not really valid autotile images, but the alternative is a crash on some runtimes.
b.autotiles[0] = a; b.autotiles[1] = a; b.autotiles[2] = a
b.autotiles[3] = a; b.autotiles[4] = a; b.autotiles[5] = a
b.autotiles[6] = a
b.map_data = load_data("Data/Map001.rxdata").data
b.priorities = ns
b.flash_data = Table.new(b.map_data.xsize, b.map_data.ysize, 1)
b.update

c = Tilemap.new()
c.tileset = a
c.autotiles[0] = a; c.autotiles[1] = a; c.autotiles[2] = a
c.autotiles[3] = a; c.autotiles[4] = a; c.autotiles[5] = a
c.autotiles[6] = a
c.map_data = load_data("Data/Map002.rxdata").data
c.priorities = ns
c.flash_data = Table.new(c.map_data.xsize, c.map_data.ysize, 1)
c.update

n = Tilemap.new()
n.tileset = a
n.autotiles[0] = a; n.autotiles[1] = a; n.autotiles[2] = a
n.autotiles[3] = a; n.autotiles[4] = a; n.autotiles[5] = a
n.autotiles[6] = a
n.map_data = load_data("Data/Map003.rxdata").data
n.priorities = ns
n.flash_data = Table.new(n.map_data.xsize, n.map_data.ysize, 1)
n.update

# Now the fun part is over, just setup the main render loop

Graphics.transition(10, "", 40)

Input.update()
while not Input.trigger?(Input::A)
 b.ox = Graphics.frame_count 
 c.ox = Graphics.frame_count * 4
 n.ox = Graphics.frame_count * 16
 b.update
 c.update
 n.update
 Graphics.update()
 Input.update()
end
Graphics.freeze()
b.dispose()
c.dispose()
n.dispose()
a.dispose()
Graphics.transition(10, "", 40)

