# class RPG::Map IPL

## static function new(width Fixnum, height Fixnum) -> Map

Creates a new Map.

*No Chapter*


## getset tileset_id = Fixnum

ID of a Tileset. Defaults to 1 in a new map.

*No Chapter*


## getset width = Fixnum

Width of the map in tiles.

*No Chapter*


## getset height = Fixnum

Height of the map in tiles.

*No Chapter*


## getset autoplay_bgm = Boolean

Height of the map in tiles.

*No Chapter*


## getset bgm = RPG::AudioFile

The BGM for this map.

*No Chapter*


## getset autoplay_bgs = Boolean

Height of the map in tiles. Defaults to a blank audio file.

*No Chapter*


## getset bgs = RPG::AudioFile

The BGS for this map. Defaults to a blank audio file but with a volume of 80.

*No Chapter*


## getset encounter_list = Fixnum[]

Array of Troop IDs. Defaults to being empty.

*No Chapter*


## getset encounter_step = Fixnum

Encounter chance. Defaults to 30.

*No Chapter*


## getset data = Table

Defaults to a new Table with dimensions (width, height, 3).

*No Chapter*


## getset events = Hash<Fixnum, RPG::Event>

Maps event IDs to the RPG::Events.

*No Chapter*

