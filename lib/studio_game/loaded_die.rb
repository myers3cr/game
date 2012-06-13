require_relative "auditable"

module StudioGame
  class LoadedDie
    include Auditable

    attr_reader :number
  
    def roll
      numbers = [1, 2, 3, 5, 6, 6]
      @number = numbers.sample
      audit
      @number
    end # roll
  end # class LoadedDie
end # module StudioGame

# test code
if __FILE__ == $0
  die = StudioGame::LoadedDie.new
  10.times do
    puts die.roll
  end
end