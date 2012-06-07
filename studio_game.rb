require_relative "game"
require_relative "clumsy_player"
require_relative "berserk_player"

game = Game.new("Knuckleheads")
game.load(ARGV.shift || "knuckleheads.csv")

game.add_player(ClumsyPlayer.new("klutz", 105))
game.add_player(BerserkPlayer.new("berserker", 50))

loop do
  puts "\nHow many game rounds? ('quit to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    game.play(answer.to_i)
  when 'quit', 'exit'
    game.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
  
  game.save_high_scores("scores.csv")
  
end

