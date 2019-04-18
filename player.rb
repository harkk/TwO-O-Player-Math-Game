class Player
  attr_reader :lives, :name
  LIVES = 3
  
  def initialize(number)
    @name = "Player #{number}"
    @lives = LIVES
  end

  def lose_life
    @lives -= 1
  end
end