require_relative "creator.rb"
require_relative "guesser.rb"
require "colorize"
require "pry"

class Mastermind
  attr_reader :computer
  attr_reader :player
  attr_reader :display

  def initialize(computer = Creator.new(), player = Guesser.new(), display = "", win_condition = false)
    @computer = computer
    @player = player
    @display = display
  end

  def colorize_code(code)
    @display = ""
    code.each do |item|
      case item
      when "R"
        @display.concat(" R ".black.on_red).concat("  ")
      when "G"
        @display.concat(" G ".black.on_green).concat("  ")
      when "Y"
        @display.concat(" Y ".black.on_yellow).concat("  ")
      when "B"
        @display.concat(" B ".black.on_blue).concat("  ")
      when "M"
        @display.concat(" M ".black.on_magenta).concat("  ")
      when "C"
        @display.concat(" C ".black.on_cyan).concat("  ")
      else
        puts "Didn't expect this :("
      end
    end
    @display
  end

  def play_round()
    #Player prompted for guess
    prompt_for_guess()
    puts "You guessed: #{colorize_code(player.guess)}"
    unless win_condition()
      #Computer gives feedback
      @computer.give_feedback(@player.guess)
    end
  end

  def prompt_for_guess()
    puts "Type in a string of four letters for your guess. Each letter corresponds to a color in the code you are trying to guess.\n Choose from: #{colorize_code(["R", "G", "Y", "B", "M", "C"])}"
    guess_str = gets.chomp.upcase
    guess_str.gsub!(/\s+/, "")
    until (guess_str.match(/^[RGYBMC ]{4}$/))
      puts "Please enter a valid input (e.g.: R G B Y)"
      guess_str = gets.chomp.upcase
      guess_str.gsub!(/\s+/, "")
    end
    @player.build_guess(guess_str)
  end

  def win_condition()
    return (@player.guess == @computer.code)
  end
end

# Display Instructions

#Initialize Game
new_game = Mastermind.new()

#Computer generates code to be broken
new_game.computer.generate_code

#Play the game for 12 rounds
count = 0
until (new_game.win_condition()) || (count == 12)
  #Play round
  puts "Round #{count + 1} / 12"
  new_game.play_round()
  count += 1
end

#Display end game message
if (new_game.win_condition())
  puts "Awesome! You cracked the code!"
else
  puts "You lose! The code was #{new_game.colorize_code(new_game.computer.code)} Better luck next time :)"
end


