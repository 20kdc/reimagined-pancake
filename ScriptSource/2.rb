# reimagined-pancake - Code as documentation on RGSS1 (RPG Maker XP)
# Written starting in 2018 by contributors (see CREDITS.md)
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

##

# # Chapter 2. Introducing the Input module.

# The Input module is a critical part of RGSS1. The reasons for this should be obvious.
#
# Firstly, I'd like to note that MKXP extends the Input module's capabilities.
# Not to generate incompatibility, I assume, but to replace functionality previously handled using the Windows API.
#
# In particular, 3 mouse buttons are exposed as keys, and the mouse position can be read.
#
# This is not a standard part of RGSS1, so I do not demonstrate it here.
# However, the reference has further details.
#
# Here, a simple "fake joystick" will be shown, with the Z keyboard key exiting.
#
# Firstly, initialize what we're going to use graphically for this.

a = Bitmap.new("Graphics/Pictures/screenD")
b = Bitmap.new("Graphics/Pictures/circle")

n = Plane.new()
n.bitmap = a

# A new class that gets introduced here is the Sprite class.
# It's pretty much as it's name suggests - a simple image display.
# The present focus is on input here, so see the reference for more details, but in particular:
#
#  + `class Sprite`
#    + `x = Fixnum`, `y = Fixnum` : controls where the sprite is shown.
#    + `src_rect = Rect` : controls where the sprite is sampled from.
#    + `z = Fixnum` : As this is a viewport element, it has this.
#
# With that given, let's see how it's used:

ns = Sprite.new()
ns.bitmap = b
ns.x = 304 # Centre for a 32x32 pixel sprite at 640x480.
ns.y = 224
ns.src_rect = Rect.new(0, 0, 32, 32)

# ...the problem is, that in this case we're overlapping a Plane. So we need to set Z accordingly.
#
# Higher Z -> 'closer to screen'. (For RGSS2, Y-sort is used for equal Z, but not in RGSS1.)

n.z = 0
ns.z = 100

Input.update()

# Here's where the new stuff begins.
#
# + `module Input`
#   + `Input.update() -> nil` : Re-polls the input devices.
#   + `Input.press?(k Fixnum) -> Boolean` : Is the key down?
#   + `Input.trigger?(k Fixnum) -> Boolean` : Was the key pressed between the last two input updates?
#   + `Input.repeat?(k Fixnum) -> Boolean` : Some keys auto-repeat if held down, has this occurred between the last two input updates?
#   + `Input.dir4() -> Fixnum` : Get direction, limiting to the basic 4 directions.
#   + `Input.dir8() -> Fixnum` : Get direction, allowing diagonals.
#
# The easiest way to visualize the direction numbers is a square:
# 
# <table><tr><td>
# 7 </td><td> 8 </td><td> 9 </td></tr><tr><td>
# 4 </td><td>   </td><td> 6 </td></tr><tr><td>
# 1 </td><td> 2 </td><td> 3 </td></tr></table>
#
# (Apologies to those reading the raw Ruby file.)
#
# And the second-easiest way to remember them is most likely:
#
# 1234, 6789, minor 3 right, major 3 up.
#
# (The first-easiest way is probably protected by copyright.)
#
# Now, what we want is the keyboard key Z.
# But the way RGSS works is that the major action keys are semi-configurable.
#
# There's 8 "virtual keys" - ABCXYZLR - and some set of physical keys which can map to them.
# Pressing F1 will show the input configuration screen.
#
# In this case, Z (physical) maps to A (virtual) by default - this probably means "advance".
#

while not Input.trigger?(Input::A)
# And now for a demonstration of dir4 and dir8.
 d8 = Input.dir8()
 px = 0
 py = 0
 if d8 == 1
  px = -1
  py = 1
 elsif d8 == 2
  py = 1
 elsif d8 == 3
  px = 1
  py = 1
 elsif d8 == 4
  px = -1
 elsif d8 == 6
  px = 1
 elsif d8 == 7
  px = -1
  py = -1
 elsif d8 == 8
  py = -1
 elsif d8 == 9
  px = 1
  py = -1
 end

# Now the circle gets repositioned according to the offset worked out above.

 ns.x = (320 + (px * 32)) - 16
 ns.y = (240 + (py * 32)) - 16

# And now the usual updates.

 Input.update()
 Graphics.update()
end

# At this point, Z has been pressed. Firstly:
# This is for the sake of the menu, should it be running.

Graphics.freeze()

# And the rest is just good behavior.

n.dispose()
ns.dispose()
a.dispose()
b.dispose()
