# reimagined-pancake - Code as documentation on RGSS1 (RPG Maker XP)
# Written starting in 2018 by contributors (see CREDITS.md)
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# Menu. Launches the self-contained examples with minimal pollution.

class PancakeMenu
 def initialize()
  @entries = [
   "reimagined-pancake example menu - Z to select, up/down to pick.",
   "Chapter 1. An outline of the RGSS1 graphics system.",
   "Chapter 2. Introducing the Input module.",
   "Chapter 3. Tilemaps (Plural) - or, how I learned to stop worrying and love the tilemaps.",
   "Chapter 4. Transitions (detailed).",
   "Chapter 5. Viewports.",
   "Chapter 6. A window to another world."
  ]
  @cursor_rect_target = 1
  start_window
  while true
   @window.update
   Graphics.update
   Input.update
   if Input.trigger?(Input::A)
    Audio.se_play("Audio/SE/select")
    @window.visible = false
    Graphics.frame_count = 0
    $pancake.run(@cursor_rect_target.to_s)
    @window.visible = true
   end
   if Input.trigger?(Input::UP) or Input.repeat?(Input::UP)
    @cursor_rect_target = @cursor_rect_target - 1
    if @cursor_rect_target < 1
     @cursor_rect_target = 1
    end
    Audio.se_play("Audio/SE/change")
   end
   if Input.trigger?(Input::DOWN) or Input.repeat?(Input::DOWN)
    @cursor_rect_target = @cursor_rect_target + 1
    if @cursor_rect_target >= @entries.length
     @cursor_rect_target = @entries.length - 1
    end
    Audio.se_play("Audio/SE/change")
   end
   crp_targ = @cursor_rect_target * 18
   if @window.cursor_rect.y < crp_targ
    @window.cursor_rect.y = @window.cursor_rect.y + 5
    if @window.cursor_rect.y > crp_targ
     @window.cursor_rect.y = crp_targ
    end
   end
   if @window.cursor_rect.y > crp_targ
    @window.cursor_rect.y = @window.cursor_rect.y - 5
    if @window.cursor_rect.y < crp_targ
     @window.cursor_rect.y = crp_targ
    end
   end
  end
 end
 def start_window()
  @window = Window.new()
  @window.windowskin = Bitmap.new("Graphics/Windowskins/menu")
  @window.cursor_rect = Rect.new(0, @cursor_rect_target * 18, 640 - 32, 18)
  @window.active = true
  @window.stretch = false
  @window.pause = false

  @window.x = 0
  @window.y = 0
  @window.width = 640
  @window.height = 480
  @window.ox = 0
  @window.oy = 0
  @window.opacity = 255
  @window.back_opacity = 255
  @window.contents_opacity = 255

  @window.contents = Bitmap.new(640 - 32, 480 - 32)
  @window.contents.font.size = 16
  @entries.each_with_index do | s, i |
   @window.contents.draw_text(2, (i * 18), 640 - 32, 16, s)
  end
 end
end
PancakeMenu.new
