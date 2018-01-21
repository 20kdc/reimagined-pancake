# reimagined-pancake - Code as documentation on RGSS1 (RPG Maker XP)
# Written starting in 2018 by contributors (see CREDITS.md)
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# This gets baked into Scripts.rxdata.
# It's job is to control the transitions between components in a sane manner.
# The self-contained examples don't have entry fades, but do have exit fades.
# These exit fades are kept, and then the transition to the main screen occurs.
# 

class PancakeExecutive
 attr_accessor :loading

 def initialize()
  @loading = true
 end

 def end_loading()
  if @loading
   @loading = false
   n = Graphics.frame_count
   Graphics.transition(Graphics.frame_rate / 2, "Graphics/Transitions/ptl2", 8)
   Graphics.frame_count = n
  end
 end

 def run(str)
  @loading = true
  Graphics.freeze
  load "ScriptSource/" + str + ".rb"
  @loading = true
 end
end

$pancake = PancakeExecutive.new()

module Graphics
 class << self
  alias_method :__pancake_update__, :update
 end
 def self.update
  $pancake.end_loading
  self.__pancake_update__()
 end
end

$pancake.run("menu")