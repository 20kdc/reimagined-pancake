# reimagined-pancake - Code as documentation on RGSS1 (RPG Maker XP)
# Written starting in 2018 by contributors (see CREDITS.md)
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# Chapter 2. Introducing the Input module.
# The Input module is a critical part of RGSS1. The reasons for this should be obvious.

# Firstly, I'd like to note that MKXP extends the Input module's capabilities.
# Not to generate incompatibility, I assume, but to replace functionality previously handled using the Windows API.
# In particular, key codes 38, 39, and 40 are the mouse buttons from left to right,
#  and the mouse position can be read in MKXP. This is not a standard part of RGSS1, so I do not demonstrate it here.
# Hopefully it's use should be obvious from what is explained, along with the function names:
#  Input.mouse_x Input.mouse_y
#  and: MOUSELEFT, MOUSEMIDDLE, MOUSERIGHT

# Here, a simple "fake joystick" will be shown, with Z to move onto the next part.

Graphics.freeze()

# Firstly, initialize what we're going to use graphically for this.
a = Bitmap.new("Graphics/Pictures/screenD.png")
b = Bitmap.new("Graphics/Pictures/circle.png")
n = Plane.new()
n.bitmap = a

# A new class that gets introduced here is the Sprite class.
# It's pretty much as it's name suggests - a simple image display.
# The present focus is on input here, so see the reference for more details, but in particular:
# 1. .x/.y controls where the sprite is shown - OX/OY is the "origin" for effects like rotation
# 2. .src_rect controls where the sprite is sampled from.

ns = Sprite.new()
ns.bitmap = b
# Just initialize to centre here. Notice lower Z is "closer to screen".
ns.x = 304
ns.y = 224
ns.src_rect = Rect.new(0, 0, 32, 32)

# ...the problem is, that in this case we're overlapping a Plane. So we need to set Z accordingly.
# Higher Z -> 'closer to screen'. (For RGSS2, Y-sort is used for equal Z, but not in RGSS1)
n.z = 0
ns.z = 100

Graphics.transition(10, "", 40)
Input.update()
# Input.update() : Re-polls the input devices.
# Input.press?(k) : Is the key down?
# Input.trigger?(k) : Was the key released (after being pressed) between the last two input updates?
# Input.repeat?(k) : Some keys auto-repeat if held down, has this occurred between the last two input updates?

# Now, what we want is the keyboard key Z.
# But the way RGSS works is that the major action keys are semi-configurable.
# There's 8 "virtual keys" - ABCXYZLR - and some set of physical keys which can map to them.
# In this case, Z (physical) maps to A (virtual) by default - this probably means "advance".
# Pressing F1 will show the input configuration screen.
while not Input.trigger?(Input::A)
 # Now for a demonstration of dir4 and dir8.
 # The basics are that dir4 and dir8 return one of the following, (with a restriction for dir4):
 # 0: None
 # 1: Down-Left
 # 2: Down (:DOWN)
 # 3: Down-Right
 # 4: Left (:LEFT)
 # 5 is unused for some reason
 # 6: Right (:RIGHT)
 # 7: Up-Left
 # 8: Up (:UP)
 # 9: Up-Right
 d8 = Input.dir8()
 px = 0
 py = 0
 # puts(d8.to_s + "\n")
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
 ns.x = (320 + (px * 32)) - 16
 ns.y = (240 + (py * 32)) - 16
 Input.update()
 Graphics.update()
end
# Z has been pressed - clean up.
Graphics.freeze()
n.dispose()
ns.dispose()
a.dispose()
b.dispose()
Graphics.transition(10, "", 40)
