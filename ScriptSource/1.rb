# reimagined-pancake - Code as documentation on RGSS1 (RPG Maker XP)
# Written starting in 2018 by contributors (see CREDITS.md)
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

##
# # Foreword: Just some boilerplate
#
# This semi-book assumes you have some programming knowledge, preferably in Ruby.
# Anything that one would expect from a book describing Ruby is not here - there are plenty of other sources.
#
# If you're wondering where the name came from...
# "Great repository names are short and memorable. Need inspiration? How about reimagined-pancake."
#
# The source of information for this document is MKXP, an open source reimplementation of RGSS1.
# Thus, this information and code cannot be claimed by Kadokawa, Enterbrain, Degica, or related companies.
#
# In this text, you will see sections of code, indicated as so:
#
#     This is a code block. It is not actually code, however. It just looks like a code block.
#
# In the main chapter series, all the code blocks make up one RGSS1 script per chapter.
# These scripts could be put into a Scripts.rxdata file and run in order, and they should work.
#
# You may see certain terms, such as {Bitmap.new}, written in curly braces.
#
# These terms refer to a specific function, class, or module in the Reference.
#
# Also note that you may see code used within bullet points, as so:
#
# + `class Canary`
#   + `Canary.new(twitter_user Fixnum) -> Canary` : This is a static function with one Fixnum parameter that returns a Canary.
#   + `canary.tweet() -> String` : This is an instance function with no parameters that returns a String.
#   + `canary.last_tweet = String` : This is both a getter - "last\_tweet" and a setter - "last\_tweet=" - these are abbreviated to be concise.
#
# These definitions are somewhat expanded links to the Reference. They are not usually complete.
# In the case of the "interfaces" defined in chapter 1, they do not even exist, as such.
# If they do exist, look for the class or module, then read until you reach the relevant definition.
#
# Definitions shown on a *class* are somewhat special.
# If they start with the name of the class, followed by a dot, these are marked 'static' in the reference.
# If they start with the first letter of the name of the class, in lowercase, again followed by a dot - these are not marked 'static'.
#
# This is because static definitions on a class are uncommon, with the exception of 'new'.
# (And even that is still only once per class.)
# However, they are not so uncommon for modules - thus, 'static' is omitted there.
#
# Definitions shown on a module are always static, all the time.
#
# # Chapter 1. An outline of the RGSS1 graphics system.
#
# Classes beginning with "I" are not real classes, but 'interfaces' specified to avoid repetition.
#
# RGSS critical structures are Color, Tone, and Rect.
# Color and Tone use floats, despite using 0-255 ranges.
# As for constructors and properties, these can be described almost entirely by:
#
#  + class Color
#    + `Color.new(red, green, blue, [alpha]) -> Color`
#    + `c.set(red, green, blue, alpha) -> nil`
#  + class Tone
#    + `Tone.new(red, green, blue, [gray]) -> Tone`
#    + `t.set(red, green, blue, gray) -> nil`
#  + class Rect
#    + `Rect.new(x, y, width, height) -> Rect`
#    + `r.set(x, y, width, height) -> nil`
#
# In which the argument names given are also the name of the properties.
#
# In RGSS, a Bitmap is the same sort of thing as it is in GDI.
# It's an object with graphics that can be written to and used in display.
#
# The following is the list of constructors for Bitmap:
#
#  + class Bitmap
#     + `Bitmap.new(string) -> Bitmap` : Creates a Bitmap from a file.
#     + `Bitmap.new(width, height) -> Bitmap` : Creates a new, blank bitmap.
#
# Bitmaps have quite a few functions, so I won't list them all here.
# For that, I recommend looking at the reference.
#
# In particular, {Bitmap.width} and {Bitmap.height} return the bitmap's width and height.
# And a bitmap can be copied with {Bitmap.clone}.

a = Bitmap.new("Graphics/Pictures/screenA.png")
b = Bitmap.new("Graphics/Pictures/screenB.png")
c = Bitmap.new("Graphics/Pictures/screenC.png")

# RGSS1's graphics system is somewhat insidious - it's simple at first, and then Tilemaps and Viewports come along to ruin your lunch.
#
# From the top level, there is nil, also known as the primary viewport, also known as the game window.
#
# That can contain various "scene elements", which generally share some properties:
#
#  + `interface ISceneElement`
#    + `i.z = int`
#    + `i.visible = boolean`
#
# (Note: Types are specified here, as there is no equivalent in the Reference.)
#
# Viewports are scissoring and layering control devices.
# Or in other words, "something you can display stuff to, with a fixed size, and with everything inside having the same Z relative to other stuff."
#
# The primary viewport in RGSS1 is 640x480, with rare exceptions.
# For example, MKXP allows altering this via configuration, and RGSS2/3 allows reading and changing the screen resolution at runtime.
#
# Viewports may have viewport elements, which are also scene elements:
#
#  + `interface IViewportElement`
#    + `i.z = Fixnum`
#    + `i.visible = Boolean`
#    + `i.viewport = Viewport`
#    + `i.dispose() -> nil` : Dispose the object - makes it unusable.
#    + `i.disposed?() -> Boolean` : Has this been disposed yet?
#
# The connection between a viewport and it's elements is entirely controlled by the viewport property.
#
# For simplicity's sake, no viewports will be used here.
#
# Here's the first use of a viewport element in this program.

n = Plane.new()
n.bitmap = a

# A Plane is a simple example of a viewport element. It's an image that tiles infinitely.
#
# A reminder - this is not all of what Plane has available, only what will be used here.
#
# + `class Plane`
#   + `Plane.new([viewport]) -> Plane` : Creates a Plane, optionally setting viewport.
#   + `p.bitmap = Bitmap` : The bitmap.
#   + `p.dispose() -> nil` : Dispose of this Plane, making it unusable/invisible/etc.
#
# RGSS1, by default, runs at 40 FPS. Other RGSS versions run at 60 FPS.
#
# That said, the graphics subsystem reserves the ability to not render frames in case it's required.
# You can use {Graphics.frame_reset} to try and force it to render a frame next time you {Graphics.update}
#  (after, say, a long-CPU operation), though.
#
# Talking of the graphics subsystem, the next object to use is {Graphics}.
#
# + `module Graphics`
#   + `Graphics.frame_count = Fixnum` : A frame counter. Automatically updated (including during transitions), but you can change it yourself.
#   + `Graphics.frame_rate = Fixnum` : Allows changing the internal frame rate (disregarding skipped frames)
#   + `Graphics.freeze -> nil` : Snapshots the current state as a preparation for a transition.
#   + `Graphics.update -> nil` : Refreshes the screen. There cannot be a gap of 10 seconds or over between these calls, or the game will exit.
#   + `Graphics.transition(time, transitionFilename, vague)` : Freezes the Ruby code while it runs, and fades from the frozen state to the {Graphics.update}d state.
#
# For {Graphics.transition}, more explaination is required:
#
# + "time" is a Fixnum, the amount of time in frames for the whole transition.
# + "vague" is a Fixnum, which is a somewhat confusing mess, and is best described by "See Chapter 4."
#
# Graphics.transition's default arguments are (8, "", 40), which is a fast simple fade.
# The usage of this is: you freeze the current screen, move everything to the new screen, then transition.
#
# So, after a lot of waffling, we have our Bitmap - b - and our Plane - n.
# It's now time for some actual useful code.
#
# Firstly, set the frame counter to 0, just in case these examples are being run in the wrong order.
Graphics.frame_count = 0
stage = 0
while true
# Secondly, check which stage we're in, and if the time is above some point, go to the next stage.
 if stage == 0
  if Graphics.frame_count >= 40
   Graphics.freeze()
   n.bitmap = b
   Graphics.transition()
   stage = 1
  end
 elsif stage == 1
  if Graphics.frame_count >= 80
   Graphics.freeze()
   n.bitmap = c
   Graphics.transition()
   stage = 2
  end
 elsif stage == 2
  if Graphics.frame_count >= 120
   break
  end
 end
# Graphics.update updates the output - Input.update updates the input.
# As previously stated, you must call Graphics.update in a semi-timely fashion to prevent the game assuming it has crashed.
 Graphics.update
 Input.update
end

# This line is for the benefit of 'menu.rb', which is the launcher used to run these examples.
# 'menu.rb' expects a final freeze to allow it to perform a transition back to the menu.
# In other RGSS1 programs, this final freeze would be completely irrelevant.

Graphics.freeze

n.dispose
a.dispose
b.dispose
c.dispose

# Running off the end of all scripts quits the game.
# While in this case this script is actually being loaded by a launcher, if this were run standalone, it would end now.
