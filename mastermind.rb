require_relative "creator.rb"
require_relative "guesser.rb"
class Mastermind
  attr_reader :game
  def initialize(computer=Creator.new(),player=Guesser.new())
    @computer = computer
    @player = player
  end

  def create_blocks()
    red =  " R ".black.on_red
    green = " G ".black.on_green
    yellow = " Y ".black.on_yellow
    blue = " B ".black.on_blue
    magenta = " M ".black.on_magenta
    cyan = " C ".black.on_cyan
  end

  def display_code(code)

  end
  
end