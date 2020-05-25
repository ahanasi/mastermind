require_relative "creator.rb"
require_relative "guesser.rb"
require "colorize"
require "pry"

class Mastermind
  attr_reader :computer
  attr_reader :player
  attr_reader :display

  def initialize(computer = Creator.new(), player = Guesser.new(), display = "")
    @computer = computer
    @player = player
    @display = display
  end

  def colorize_code(code)
    code.each do |item|
      case item
      when "R"
        @display.concat(" R ".black.on_red)
      when "G"
        @display.concat(" G ".black.on_green)
      when "Y"
        @display.concat(" Y ".black.on_yellow)
      when "B"
        @display.concat(" B ".black.on_blue)
      when "M"
        @display.concat(" M ".black.on_magenta)
      when "C"
        @display.concat(" C ".black.on_cyan)
      else
        puts "Didn't expect this :("
      end
    end
  end
end

new_game = Mastermind.new()
new_game.computer.generate_code
new_game.colorize_code(new_game.computer.code)
puts new_game.display
