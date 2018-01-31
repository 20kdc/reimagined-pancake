# class RPG::Sprite < Sprite IPL

An extension of Sprite, this contains several utility functions, including animation display.

Note that these functions are described as having over-time effects - these are managed by instance variables described later, along with the update function.

They do not hold up the script.

## function whiten() -> nil

Set blend type to 0, opacity 255, and change the colour to (255, 255, 255, 128) for 16 frames, with color alpha going down by 10 per frame.

Useful when, for example, a creature has died.

*No Chapter*


## function appear() -> nil

Set blend type to 0, opacity 0, colour black-with-0-alpha, and increase opacity over 16 frames.

Unsure how this works at all with alpha being 0.

*No Chapter*


## function escape() -> nil

Set blend type to 0, opacity 255, colour black-with-0-alpha, and decrease opacity over 32 frames.

*No Chapter*


## function collapse() -> nil

Set blend type to 1 (additive), opacity 255, colour (255, 64, 64, 255), and decrease opacity over 32 frames.

*No Chapter*


## function damage(value Any, critical Boolean) -> nil

Displays a damage number above the sprite, over 40 frames.

If value is a Numeric, and under 0, the value is abs'd and written in green.

In any case, it is converted to a string.

*No Chapter*


## function animation(anim RPG::Animation, flash\_cond\_flag Boolean) -> nil

Displays an animation connected to this sprite (even if the animation is screen-wide, moving this sprite will still move the animation)

There can only be one of these at a time.

flash\_cond\_flag controls the animation's timings (flashes, SEs), which can be set to only trigger if this is true/false.

*No Chapter*


## function loop\_animation(anim RPG::Animation) -> nil

Displays a looping animation connected to this sprite (even if the animation is screen-wide, moving this sprite will still move the animation)

There can only be one of these at a time.

*No Chapter*


## function dispose\_damage() -> nil

Dispose of the damage sprite.

*No Chapter*


## function dispose\_animation() -> nil

Dispose of the current animation.

*No Chapter*


## function dispose\_loop\_animation() -> nil

Dispose of the current looped animation.

*No Chapter*


## function blink\_on() -> nil

Enable blinking.

*No Chapter*


## function blink\_off() -> nil

Disable blinking.

*No Chapter*


## function blink?() -> Boolean

Is this blinking?

*No Chapter*


## function effect?() -> Boolean

Is any effect occurring (whiten, appear, escape, collapse, damage, non-looping animation)?

*No Chapter*


## function update\_animation() -> nil

Updates the current animation. Called by update, so you shouldn't need to do this.

*No Chapter*


## function update\_loop\_animation() -> nil

Updates the current loop-animation. Called by update, so you shouldn't need to do this.

*No Chapter*


## function animation\_set\_sprites(sprites Sprite[], cell_data Table, position Fixnum) -> nil

Part of animation processing, setting up the 16 animation sprites. Should be called by other functions.

*No Chapter*


## function animation\_process\_timing(timing RPG::Animation::Timing, flash\_cond\_flag Boolean) -> nil

Part of animation processing, setting up the 16 animation sprites. Should be called by other functions.

*No Chapter*

