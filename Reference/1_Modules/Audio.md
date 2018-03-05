# module Audio

Allows controlling the BGM, BGS, MEs, and SEs.

## function \_\_reset\_\_() -> nil

Stops all sounds.

*No Chapter*


## function bgm\_play(file String, volume = 100, pitch = 100) -> nil

Plays an audio file as a BGM, referred to by path (such as "Audio/BGM/woof"), with or without extension.

*No Chapter*


## function bgm\_stop() -> nil

Stops the current BGM.

*No Chapter*


## function bgm\_fade(fade Fixnum) -> nil

Fades out the current BGM over a given amount of milliseconds.

*No Chapter*


## function bgs\_play(file String, volume = 100, pitch = 100) -> nil

Plays an audio file as a BGS, referred to by path (such as "Audio/BGS/wind"), with or without extension.

*No Chapter*


## function bgs\_stop() -> nil

Stops the current BGS.

*No Chapter*


## function bgs\_fade(fade Fixnum) -> nil

Fades out the current BGS over a given amount of milliseconds.

*No Chapter*

## function me\_play(file String, volume = 100, pitch = 100) -> nil

Plays an audio file as a ME, referred to by path (such as "Audio/ME/achievement\_get"), with or without extension.

*No Chapter*


## function me\_stop() -> nil

Stops the current ME.

*No Chapter*


## function me\_fade(fade Fixnum) -> nil

Fades out the current ME over a given amount of milliseconds.

*No Chapter*


## function se\_play(file String, volume = 100, pitch = 100) -> nil

Plays an audio file as a SE, referred to by path (such as "Audio/SE/select"), with or without extension.

*No Chapter*


## function se\_stop() -> nil

Stops the current ME.

*No Chapter*

