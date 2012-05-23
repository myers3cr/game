require_relative "player"

describe Player do
  
  before do
    $stdout = StringIO.new # hack to prevent program output during testing
    @initial_health = 150
    @name = "fred"
    @player = Player.new(@name, @initial_health)
  end

  it "has a capitalized name" do
    @player.name.should == "Fred"
  end
  
  it "has an initial health" do
    @player.health.should == 150
  end

  it "has a string representation" do
    @player.to_s.should == "I'm Fred with a health of #{@initial_health} and a score of #{@initial_health + 4}."
  end

  it "computes a score as the sum of its health and length of name" do
    @player.score.should == @initial_health + 4
  end

  it "increases health by 15 when w00ted" do
    @player.w00t
    @player.health.should == @initial_health + 15
  end

  it "decreases health by 10 when blammed" do
    @player.blam
    @player.health.should == @initial_health - 10
  end

  context "with a default health" do
    before do
      @player = Player.new(@name)
    end
    
    it "has a health of 100" do
      @player.health.should == 100
    end  
  end
  
  context "with a health of greater than 100" do
    before do
      @player = Player.new(@name, 150)
    end
    
    it "is strong" do
      @player.should be_strong
    end
  end
  
  context "with a health of 100 or less" do
    before do
      @player = Player.new(@name, 100)
    end
    
    it "is wimpy" do
      @player.should_not be_strong
    end
  end
  
end
