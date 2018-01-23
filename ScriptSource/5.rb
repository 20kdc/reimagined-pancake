# reimagined-pancake - Code as documentation on RGSS1 (RPG Maker XP)
# Written starting in 2018 by contributors (see CREDITS.md)
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

##
# # Chapter 5. Viewports.
#
# As previously mentioned, viewports are layering, scrolling and scissoring tools.
#
# Here, they will be used for 3 identical instances of a basic rotozoomer.
#
#  + `class Viewport`
#    + `Viewport.new(r Rect/x Fixnum, y Fixnum, w Fixnum, h Fixnum) -> Viewport` : Creates a viewport to show in a given place & size on-screen.
#    + `v.flash(colour Color, duration Fixnum) -> nil` : Start a colour flash on the viewport for the given duration in frames.
#    + `v.update() -> nil` : Update the viewport - used for flashes (in particular)
#    + `v.color = Color` : Colour adjustment.
#    + `v.tone = Tone` : Tone adjustment.
#    + `v.rect = Rect` : The position and size of the viewport on-screen. The top-left of this is (ox, oy) inside the viewport.
#    + `v.ox = Fixnum` / `v.oy = Fixnum` : The camera position.
#    + `v.z = Fixnum` : The viewport's Z layer. While anything inside is presumably drawn with respect to Z, the viewport is probably drawn all at once.
#    + `v.visible = Boolean` : Is the viewport visible?
#    + `v.dispose() -> nil` : Dispose the object - makes it unusable.
#    + `v.disposed?() -> Boolean` : Has this been disposed yet?
#
# Before doing anything, define some decent contents.

class C5_Rotozoomer
 def initialize(viewport)
  icon = Bitmap.new("Graphics/Pictures/roto2r")
  @c = Bitmap.new(1024, 1024)
  (0..((@c.width / icon.width) - 1)).each do | x |
   (0..((@c.height / icon.height) - 1)).each do | y |
    @c.blt(x * icon.width, y * icon.height, icon, Rect.new(0, 0, icon.width, icon.height))
   end
  end
  icon.dispose()
  @n = Sprite.new(viewport)
  @n.bitmap = @c
  @n.src_rect = Rect.new(0, 0, @c.width, @c.height)
 end
 def update()
  scx = (Math.sin((Graphics.frame_count.to_f / 120.0) * Math::PI) * 128).to_i
  scy = (Math.cos((Graphics.frame_count.to_f / 120.0) * Math::PI) * 128).to_i
  @n.ox = (@c.width / 2) + scx
  @n.oy = (@c.height / 2) + scy
  @n.x = 320 + scx
  @n.y = 240 + scy
  @n.angle = Graphics.frame_count
  @n.zoom_y = (Math.sin((Graphics.frame_count.to_f / 80.0) * Math::PI) * 2) + 3.25
  @n.zoom_x = @n.zoom_y
 end
 def dispose()
  @n.dispose
  @c.dispose
 end
end

# Now that part's over with, define the three viewports.

# v1 is to the top-left, and serves as a reference for v3.
#
# v2 is to the top-right, but it's camera position is 0, 0, so it mirrors v1.
#
# v3 is to the bottom, scrolling left and right, but it's camera position is synchronized to it's screen position.
#
# This causes it to appear to be part of the same world as v1.

v1 = Viewport.new(0, 0, 316, 244)
v2 = Viewport.new(324, 0, 316, 236)
v3 = Viewport.new(0, 244, 316, 236)

# Create the Rotozoomers.

a = C5_Rotozoomer.new(v1)
b = C5_Rotozoomer.new(v2)
c = C5_Rotozoomer.new(v3)

# The usual main loop.
# Updates stuff that needs to be updated.
#
# Not much to see here.

Graphics.frame_count = 0
Input.update
while not Input.trigger?(Input::A)
 sx = (Math.sin((Graphics.frame_count.to_f / 120.0) * Math::PI) * 162).to_i + 162
 v3.rect = Rect.new(sx, 244, 316, 236)
 v3.ox = sx
 v3.oy = 244
 v1.update
 v2.update
 v3.update
 a.update
 b.update
 c.update
 Graphics.update
 Input.update
end

# And that's the end of that.

Graphics.freeze
a.dispose
b.dispose
c.dispose

v1.dispose
v2.dispose
v3.dispose

