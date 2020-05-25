class Mastermind
  attr_reader :game
  def initialize(code=[],guess=Array.new(4))
    @code = code
    @guess = guess
  end

  def create_blocks()
    red =  " R ".black.on_red
    green = " G ".black.on_green
    yellow = " Y ".black.on_yellow
    blue = " B ".black.on_blue
    magenta = " M ".black.on_magenta
    cyan = " C ".black.on_cyan
  end
  
end