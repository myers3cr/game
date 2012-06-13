require_relative 'treasure_trove'
require_relative 'playable'

module StudioGame
  class Player
    include Playable
  
    attr_accessor :name
    attr_reader :health
  
    def initialize(name, health = 100)
      @name = name.capitalize
      @health = health
      @found_treasures = Hash.new(0)
    end
  
    def self.from_csv(line)
      name, health = line.split(",")
      new(name, health.to_i)
    end
    
    def to_s
      "I'm #{@name} with a health = #{@health}, points = #{points}, and score of #{score}."
    end
  
    def print_name_and_health
      puts "#{@name} (#{@health})"
    end
  
    def score
      @health + points
    end
  
    def <=>(other)
      other.score <=> self.score
    end
  
    def found_treasure(treasure)
      @found_treasures[treasure.name] += treasure.points
      puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
      # puts "#{@name}'s treasures: #{@found_treasures}"
    end
  
    def points
      @found_treasures.values.reduce(0, :+)
    end

    def each_found_treasure
      @found_treasures.each do |name, points|
        yield Treasure.new(name, points)
      end
    end
  
  end # class Player
end # module StudioGame

# test code
if __FILE__ == $0
  player = StudioGame::Player.new("moe")
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end  
