require_relative "die"
require_relative "loaded_die"
require_relative "player"
require_relative "treasure_trove"

module StudioGame
  module GameTurn

    def self.take_turn(player)
      die = Die.new
      case die.roll
      when 1..2 then 
        player.blam
      when 3..4
        puts "#{player.name} was skipped."
      else
        player.w00t
      end
      puts player

     # get a random treasure
     treasure = TreasureTrove.random
     player.found_treasure(treasure)
     # puts "#{player.name} found a #{treasure.name} worth #{treasure.points} points." 
    end # take_turn

  end # module GameTurn
end # module StudioGame