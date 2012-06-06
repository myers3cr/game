require_relative "player"
require_relative "die"
require_relative "game_turn"

class Game
  attr_reader :title

  def initialize(title)
    @title = title.capitalize
    @players = []
  end
    
  def load(from_file)
    File.readlines(from_file).each do |line|
      add_player(Player.from_csv(line))
    end      
  end
  
  def high_score_entry(player)
    "#{player.name.ljust(20, '.')} #{player.score}"
  end
  
  def save_high_scores(to_file="high_scores.txt")
    File.open(to_file, "w") do |file|      
      file.puts "#{@title} High Scores:"
      @players.sort.each do |p|
        file.puts high_score_entry(p)
      end
    end
  end

  def add_player(player)
    @players << player
  end

  def total_points
     @players.reduce(0) { |sum, player| sum + player.points }
  end

  def print_stats
# print heading
    puts "\n#{@title} Statistics:"
# print strong, wimpy player lists
    strong, wimpy = @players.partition { |p| p.strong? }
    puts "\n#{strong.length} strong players:"
    strong.each { |p| p.print_name_and_health}
    puts "\n#{wimpy.length} wimpy players:"
    wimpy.each { |p| p.print_name_and_health}
# print total treasure points
    puts "\n#{total_points} total points from treasures found"
# print each player's point totals, with breakdown by treasures
    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end
# print sorted player scores
    puts "\n#{@title} High Scores:"
    @players.sort.each do |p|
      puts high_score_entry(p)
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