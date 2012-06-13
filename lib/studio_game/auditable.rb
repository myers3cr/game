module StudioGame
  module Auditable

    def audit
      puts "Rolled a #{self.number} (#{self.class})"
    end

  end # module Auditable
end # module StudioGame