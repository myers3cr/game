require_relative "game"

game = Game.new("Knuckleheads")
game.load(ARGV.shift || "knuckleheads.csv")

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

