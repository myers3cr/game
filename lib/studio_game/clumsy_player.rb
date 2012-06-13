require_relative 'player'

module StudioGame
  class ClumsyPlayer < Player
  
    def found_treasure(treasure)
      half_point_treasure = Treasure.new(treasure.name, treasure.points / 2)
      super(half_point_treasure)
    end
  
  end # class ClumsyPlayer
end # module StudioGame

if __FILE__ == $0
  clumsy = StudioGame::ClumsyPlayer.new("klutz")  
  
  hammer = StudioGame::Treasure.new(:hammer, 50)
  clumsy.found_treasure(hammer)
  clumsy.found_treasure(hammer)
  clumsy.found_treasure(hammer)
  
  crowbar = StudioGame::Treasure.new(:crowbar, 400)
  clumsy.found_treasure(crowbar)
  
  clumsy.each_found_treasure do |treasure|
    puts "#{treasure.points} total #{treasure.name} points"
  end
  puts "#{clumsy.points} grand total points"
end