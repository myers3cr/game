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

  def total_points
     @players.reduce(0) { |sum, player| sum + player.points }
  end

  def print_stats
    strong, wimpy = @players.partition { |p| p.strong? }
    puts "\n#{@title} Statistics:"
    puts "\n#{strong.length} strong players:"
    strong.each { |p| p.print_name_and_health}
    puts "\n#{wimpy.length} wimpy players:"
    wimpy.each { |p| p.print_name_and_health}
    puts "\n#{total_points} total points from treasures found"
    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      puts "#{player.points} grand total points"
    end
    puts "\n#{@title} High Scores:"
    @players.sort.each do |p|
      puts "#{p.name.ljust(20, '.')} #{p.score}"
    end
  end
  
  def play(rounds)
    puts "There are #{@players.size} players in #{@title}:\n\n"
    @players.each do |player|
      puts player
    end
    
    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.length} treasures to be found:"
    treasures.each do |t|
      puts "A #{t.name} is worth #{t.points} points"
    end
    
    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
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