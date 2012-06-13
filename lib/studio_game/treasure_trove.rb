module StudioGame
  Treasure = Struct.new(:name, :points)

  module TreasureTrove
    TREASURES = [
      Treasure.new(:pie, 5),
      Treasure.new(:bottle, 25),
      Treasure.new(:hammer, 50),
      Treasure.new(:skillet, 100),
      Treasure.new(:broomstick, 200),
      Treasure.new(:crowbar, 400)    
    ]
  
    def self.random
      TREASURES.sample
    end

  end # module TreasureTrove
end # module StudioGame

# test code
if __FILE__ == $0
  10.times do
    puts StudioGame::TreasureTrove.random
  end
end
