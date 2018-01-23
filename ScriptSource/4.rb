# reimagined-pancake - Code as documentation on RGSS1 (RPG Maker XP)
# Written starting in 2018 by contributors (see CREDITS.md)
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

##
# # Chapter 4. Transitions (detailed).
#

# Transitions are a rather customizable effect,
# though they are always limited to one start image, one transition image, and one end image.

# Let's just set things up ready for a transition.

Graphics.update
Graphics.freeze
a = Bitmap.new("Graphics/Transitions/chocolatefactory")
n = Plane.new()
n.bitmap = a

# Firstly, a reminder of what you already know.
#
# + `module Graphics`
#   + `Graphics.freeze -> nil` : Snapshots the current state as a preparation for a transition.
#   + `Graphics.transition(time = 8, transition = "", vague = 40)` : Freezes the Ruby code while it runs, and fades from the frozen state to the {Graphics.update}d state.
#
# For {Graphics.transition}, more explaination is required:
#
# + "time" is a Fixnum, the amount of time in frames for the whole transition.
# + "transition" is either "" or the filename (extension not required) of the transition.
# + "vague" is a Fixnum, which is a somewhat confusing mess.
#
# "vague" has no effect unless you have a transition bitmap.
# To understand "vague", you need to understand how a transition bitmap is formatted.
#
# Say you have a transition bitmap where the left third is black, the middle third is grey,
#  and the right half is white.
#
# Such a bitmap is used for the second and third transition here.
#
# When 'vague' is 0, as in the second and fourth transitions, pixels instantly change.
# Essentially, there's a cutoff that starts at black and goes to white,
#  and when the cutoff is brighter than a transition pixel, the screen pixel changes.
#
# When 'vague' is 128, as in the third transition,
#  you see the left panel (which starts out at the cutoff) instantly change,
#  while the other two panels fade, with no gap between.
# Thus, 'vague' stretches the cutoff *downwards* into a linear fade.
# So a linear gradient with vague = 0 would just have the screen getting replaced as if it was the 90's,
#  while adjusting vague creates a wider and wider blurred-line from one screen to the other.
#
# Also note that, while this isn't shown here, "vague" is a 0-255 value.
# The "range" the fade occurs over is (Pixel - Vague) to Pixel.
#
# This can be seen with, say, Graphics.transition(300, "Graphics/Transitions/sweep.png", 255).
#
# The second bar immediately goes to 50% faded, ending half-way through the transition.
#
# The third bar does a "pure" fade, starting and ending just as the transition does.
#
# Graphics.transition's default arguments are (8, "", 40), which is a fast simple fade.
# The usage of this is: you freeze the current screen, move everything to the new screen, then transition.

Graphics.transition(120, "Graphics/Transitions/chocolatefactory", 128)
Graphics.freeze
n.visible = false
Graphics.transition(120, "Graphics/Transitions/sweep", 0)
Graphics.freeze
n.visible = true
Graphics.transition(120, "Graphics/Transitions/sweep", 128)
Graphics.freeze
n.visible = false
Graphics.transition(120, "Graphics/Transitions/chocolatefactory", 0)

# And we end with the usual cleanup.

n.dispose
a.dispose

Graphics.freeze
