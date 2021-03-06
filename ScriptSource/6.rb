# reimagined-pancake - Code as documentation on RGSS1 (RPG Maker XP)
# Written starting in 2018 by contributors (see CREDITS.md)
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

##
# # Chapter 6. A Window to another world.
#
# Windows are best summarized as "9-patch bitmap scrollable containers".
#
# In particular, they have a "contents bitmap", which you can control the scroll of -
#  they have arrows to show where you can scroll -
#  they have a graphic to show over the lower arrow, to tell the user to press a button -
#  and they have a "cursor rectangle", which is used to indicate an area within the window.
#
# Firstly, let's get the two images used here.

a = Bitmap.new("Graphics/Windowskins/menu")
c = Bitmap.new("Graphics/Pictures/worldscape")

# 'b' will be the main image scrolling window - 'n' will contain instructions.

b = Window.new()
b.windowskin = a
b.contents = c
b.x = 0
b.y = 0
b.width = 640
b.height = 440

n = Window.new()
n.windowskin = a
n.x = 0
n.y = 440
n.width = 640
n.height = 40
# This is how you create a bitmap that matches the containing Window.
n.contents = Bitmap.new(n.width - 32, n.height - 32)
# Fill the Bitmap with some sensible text.
n.contents.font = Font.new(Font.default_name, 12)
n.contents.draw_text(0, -1, n.contents.width, n.contents.height, "Arrow keys: Move. Z: Exit. A: Toggle Stretch. S: Toggle Pause. C: Toggle N.Active. X: Toggle N.Cursor.")

# The beginning of the usual loop:
Input.update
while not Input.trigger?(Input::A)
# Toggle the 3 major flags:
#
# Active, controls if the cursor rectangle should animate.
#
# Stretch, controls if the background image should be stretched (as opposed to tiled) under the contents area.
#
# Pause, controls the flashing "press a button to continue" prompt at the bottom of the Window.
 if Input.trigger?(Input::C)
  n.active = !n.active
  puts("N.Active toggled:" + n.active.to_s)
 end
 if Input.trigger?(Input::X)
  b.stretch = !b.stretch
  puts("Stretch toggled." + b.stretch.to_s)
 end
 if Input.trigger?(Input::Y)
  b.pause = !b.pause
  puts("Pause toggled." + b.pause.to_s)
 end
# Note that the cursor appears under the contents, so this is all done on the instructions window.
 active = n.cursor_rect.width > 0
 trig_now = Input.trigger?(Input::B)
 if trig_now
  active = !active
 end
 if active
  n.cursor_rect = Rect.new(0, 0, 608, 8)
 else
  n.cursor_rect = Rect.new(0, 0, 0, 0)
 end
# Some simple scrolling logic.
 if Input.press?(Input::LEFT)
  b.ox = b.ox - 8
 end
 if Input.press?(Input::RIGHT)
  b.ox = b.ox + 8
 end
 if Input.press?(Input::UP)
  b.oy = b.oy - 8
 end
 if Input.press?(Input::DOWN)
  b.oy = b.oy + 8
 end
# This defines the practical scroll limits of a Window.
#
# To summarize: Content size minus the size the window can hold = valid scroll offset rectangle.
#
# The Window's width and height include it's border.
# 
# The border is 16 wide, so adding both sides makes it 32.
 limit_x = b.contents.width - (b.width - 32)
 limit_y = b.contents.height - (b.height - 32)
 if b.ox >= limit_x then
  b.ox = limit_x
 end
 if b.oy >= limit_y then
  b.oy = limit_y
 end
 if b.ox < 0 then
  b.ox = 0
 end
 if b.oy < 0 then
  b.oy = 0
 end
# Update the various things involved.
 b.update
 n.update
 Graphics.update
 Input.update
end

# Dispose of things.
Graphics.freeze

n.dispose
b.dispose
a.dispose
