require_relative "player"
require_relative "die"
require_relative "game_turn"

class Game
  attr_reader :title

  def initialize(title)
    @title = title.capitalize
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def print_stats
    strong, wimpy = @players.partition { |p| p.strong? }
    puts "\n#{@title} Statistics:"
    puts "\n#{strong.length} strong players:"
    strong.each { |p| puts "#{p.name} (#{p.health})"}
    puts "\n#{wimpy.length} wimpy players:"
    wimpy.each { |p| puts "#{p.name} (#{p.health})"}
  end

  def play(rounds)
    puts "There are #{@players.size} players in #{@title}:\n\n"

    @players.each do |player|
      puts player
    end
    
    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end
end

# test code
if __FILE__ == $0
  foo = Game.new("Foo")
  player1 = Player.new("Alvin")
  foo.add_player(player1)
  player2 = Player.new("Simon", 120)
  foo.add_player(player2)
  foo.play
end