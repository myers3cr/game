require_relative "auditable"

module StudioGame
  class Die
    include Auditable
  
    attr_reader :number
  
    def initialize
      roll
    end
  
    def roll
      @number = rand(1..6)
      audit
      @number
    end  
  end # class Die
end # module StudioGame

# test code
if __FILE__ == $0
  die = StudioGame::Die.new
  10.times do
    puts die.roll
  end
  # rolls = Array.new(6, 0)
  # 30_000_000.times do
  #   number = die.roll
  #   rolls[number-1] += 1
  # end
  # puts rolls
end  
