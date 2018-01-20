# module Graphics

Contains functions and properties for controlling the RGSS graphics subsystem.

## function update() -> nil

Outputs the current graphical state to the display, and performs any inter-frame wait required.

This may do nothing at all under various load conditions, but see {Graphics.frame\_reset}.

If this is not run in 10 seconds, the game is assumed to have crashed.

In general, use with {Input.update}.

*Chapter 1*


## function frame\_reset() -> nil

This prevents the next {Graphics.update} from skipping frames.

Use after long operations, such as calculating Pi.

*No Chapter*


## function freeze() -> nil

Outputs the current graphical state to a buffer for use by {Graphics.transition}.

*Chapter 1*


## function transition(duration = 8, filename = "", vague = 40) -> nil

This performs a transition from whatever was frozen by {Graphics.freeze} to the current graphical state.

This thus technically replaces a {Graphics.update}.

Typical usage is to freeze state, switch, run this, then run the update loop.

`duration` is the total time, in frames, to wait.

`filename` can be `""` for a basic fade, or a filename such as `"Graphics/Transitions/sweep.png"`.

This defines an image, and is used in conjunction with `vague`.

Transition images are greyscale.

There is a cutoff, below which the frozen image is shown, and above which the new image is shown.

This cutoff starts at black, and moves to white over the `duration`.

However, this alone would create a sharp cut, that advances across the screen without any fading.

`vague` turns the cutoff from a cut into a fade, by extending the cutoff upwards.

When a part of the image enters the cutoff, it begins to fade - as it leaves, it has finished it's fade.

If this still confuses you, congratulations!

You're like me. For an actual example of these effects in action, see:

*Chapter 1*


## function \_\_reset\_\_() -> nil

Disposes all graphics and bitmaps at the same time.

*No Chapter*


## getset frame\_rate Fixnum

The frame rate that the game is intended to run at.

*No Chapter*


## getset frame\_count Fixnum

The amount of frames that have passed.

Doesn't affect anything in-engine, and can be set arbitrarily - so makes a good in-game-timer.

*Chapter 1*


## getset fullscreen Boolean MKXP?

Allows making the game fullscreen from within the game.

May be MKXP-only, so detect and handle accordingly.

*No Chapter*


## getset show\_cursor Boolean MKXP

Allows showing or hiding the cursor without using Windows API functions, and restricting the effect to when in the game window.

MKXP-only, so detect and handle accordingly.

*No Chapter*


## getset smooth Boolean MKXP?

Enables/disables Smooth Mode.

May be MKXP-only, so detect and handle accordingly.

*No Chapter*


## getset frameskip Boolean MKXP?

Enables/disables skipping frames.

May be MKXP-only, so detect and handle accordingly.

*No Chapter*
