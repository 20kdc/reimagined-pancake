# reimagined-pancake - Code as documentation on RGSS1 (RPG Maker XP)
# Written starting in 2018 by contributors (see CREDITS.txt)
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# If you're wondering where the name came from...
# "Great repository names are short and memorable. Need inspiration? How about reimagined-pancake."

# The source of information for this document is MKXP, an open source reimplementation of RGSS1,
#  and thus this information and code cannot be claimed by Kadokawa, Enterbrain, Degica, or related companies.

# Chapter 1. An Outline Of The RGSS1 Graphics System.

# Classes beginning with "I" are not real classes, but 'interfaces' specified to avoid repetition.

# RGSS critical structures are Color, Tone, and Rect.
# Color and Tone use floats, despite using 0-255 ranges.
# As for constructors and properties, these can be described almost entirely by:
# Color.new(red, green, blue, [alpha])
# Tone.new(red, green, blue, [grey])
# Rect.new(x, y, width, height)

# In RGSS, a Bitmap is the same sort of thing as it is in GDI.
# It's an object with graphics that can be written to and used in display.
# The following is the list of constructors for Bitmap.
# Bitmap.new(string) : Creates a Bitmap from a file.
# Bitmap.new(width, height): Creates a new, blank bitmap.
# Bitmaps have quite a few functions, so I won't list them all here.
# In particular, "Bitmap.width" and "Bitmap.height" return the bitmap's width and height.
# Copying a bitmap object with Bitmap.clone or Bitmap.dup is valid, but I don't know what the semantics are.

a = Bitmap.new("Graphics/Pictures/screenA.png")
b = Bitmap.new("Graphics/Pictures/screenB.png")
c = Bitmap.new("Graphics/Pictures/screenC.png")

# RGSS1's graphics system works like this.
# There may be a number of "Viewport"s, with nil referring to the primary viewport, also known as the game window.
# The primary viewport in RGSS1 is 640x480, with rare exceptions (for example, MKXP allows altering this).
# (RGSS2/3 allows reading and changing the screen resolution.)
# Viewports are scissoring and layering control devices.
# They are "scene elements", so they have some basic layering properties:
#  ISceneElement.z -> int
#  ISceneElement.z= int
#  ISceneElement.visible -> boolean
#  ISceneElement.visible= boolean
# But furthermore, they have "ox" and "oy" properties (to control where they are on screen),
#  a "rect" (for scissoring what's inside a viewport),
#  and "color"/"tone" (for colour effects on a viewport's contents).
# The following is the list of constructors for Viewport.
# Viewport.new(rect) : Uses a Rect object to initialize the Viewport and it's scissoring.
# Viewport.new(x, y, w, h) : Initializes a viewport with it's scissoring.

# Viewports may have viewport elements, which are also scene elements:
#  ISceneElement.z -> int
#  ISceneElement.z= int
#  ISceneElement.visible -> boolean
#  ISceneElement.visible= boolean
#  IViewportElement.viewport Viewport
#  IViewportElement.viewport= Viewport
# The connection between a viewport and it's elements is implicit,
#  and is created when the viewport element is created.
# For simplicity's sake, no "Viewport"s will be used here.

# Here's the first use of a viewport element in this program.
# A Plane is a simple example of a viewport element. It's an image that tiles infinitely.
# The property "bitmap" is as you'd expect. "ox" and "oy" are used to scroll the image - increasing OX moves the image left.
# "zoom_x" "zoom_y" are floats, 1.0 meaning 100% (no alteration).
# "opacity", "blend_type", are two ints. The first is a percentage - 100 means 100%.
# As for the second, see https://github.com/Ancurio/mkxp/blob/master/src/etc.h (BlendType) for blend_type values.
# "color", "tone" are the usual colour effects.
n = Plane.new()
n.bitmap = a

# RGSS1 runs at 40 FPS. Others run at 60 FPS.
# Graphics.frame_count is just that - a frame counter. It's automatically updated, but can be changed manually.
# Graphics.freeze is in preparation for a transition.
# Graphics.transition(time, transitionFilename, vague) freezes the Ruby code while it runs, and automatically updates.
# "time" is an integer, the amount of time in frames.
# "vague" is just that. I'm not sure from testing what it adjusts, if anything, in MKXP.
# Graphics.transition's default arguments are (8, "", 40), which is a fast simple fade.
# The usage of this is: you freeze the current screen, move everything to the new screen, then transition.
stage = 0
while true
 if stage == 0
  if Graphics.frame_count >= 40
   Graphics.freeze()
   n.bitmap = b
   Graphics.transition(10, "", 40)
   stage = 1
  end
 end
 if stage == 1
  if Graphics.frame_count >= 80
   Graphics.freeze()
   n.bitmap = c
   Graphics.transition(10, "", 40)
   stage = 2
  end
 end
 if stage == 2
  if Graphics.frame_count >= 160
   break
  end
 end
 # Graphics.update updates the output - Input.update updates the input.
 # You must call Graphics.update in a semi-timely fashion to prevent the game assuming it has crashed,
 #  except under certain circumstances.
 Graphics.update
 Input.update
end
# Get ready for fadeout
Graphics.freeze
# Disposing elements ensures they're gone.
# IDisposable.dispose
# IDisposable.disposed?
n.dispose
a.dispose
b.dispose
c.dispose
Graphics.transition(10, "", 40)
# Running off the end of all scripts quits the game.
# This ends the first chapter. The next chapter directly follows the first, and thus the game won't end now.

