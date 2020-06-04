require_relative "creator.rb"
require_relative "guesser.rb"
require "colorize"
require "pry"

class Mastermind
  attr_reader :creator
  attr_reader :guesser
  attr_reader :display

  def initialize(creator, guesser, display = "", win_condition = false)
    @creator = creator
    @guesser = guesser
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

  def computer_round()
    #Computer guesses
    @guesser.guess_code(@creator.feedback_num)
    puts "The computer guessed: #{colorize_code(@guesser.guess.code)}"
    unless win_condition()
      #Creator gives feedback
      puts @creator.give_feedback(@guesser.guess.code)
    end
  end

  def player_round()
    #Guesser prompted for guess
    prompt_for_guess()
    puts "You guessed: #{colorize_code(@guesser.guess.code)}"
    unless win_condition()
      #Creator gives feedback
      puts @creator.give_feedback(@guesser.guess.code)
    end
  end

  def prompt_for_code()
    code_str = gets.chomp.upcase
    code_str.gsub!(/\s+/, "")
    until (code_str.match(/^[RGYBMC ]{4}$/))
      puts "\nPlease enter a valid input (e.g.: R G B Y)"
      code_str = gets.chomp.upcase
      code_str.gsub!(/\s+/, "")
    end
    code_str
  end

  def prompt_for_guess()
    puts "\nType in a string of four letters for your guess. Each letter corresponds to a color in the code you are trying to guess.\n Choose from: #{colorize_code(["R", "G", "Y", "B", "M", "C"])}"
    guess_str = prompt_for_code()
    @guesser.guess.build_code(guess_str)
  end

  def win_condition()
    return (@guesser.guess.code == @creator.code.code)
  end
end

# Display Instructions

#Ask if player wants to be guesser or creator
role = nil
until (role == "B" || role == "C")
  puts "\nWould you like to be the code creator or code breaker?: (C/B) "
  role = gets.chomp.upcase
  if role == "B"
    player = Guesser.new()
    computer = Creator.new()
    new_game = Mastermind.new(computer, player)

    #Computer generates code to be broken
    new_game.creator.code.generate_code
  elsif role == "C"
    player = Creator.new()
    computer = Guesser.new()
    new_game = Mastermind.new(player, computer)

    #Player creates the code to be broken
    puts "\nType in a string of four letters for your code. Each letter corresponds to a color in the code you are trying to build.\n Choose from: #{new_game.colorize_code(["R", "G", "Y", "B", "M", "C"])}"
    code_str = new_game.prompt_for_code()
    new_game.creator.code.build_code(code_str)
  end
end

#Play the game for 12 rounds
count = 0
until (new_game.win_condition()) || (count == 12)
  #Play round
  puts "Round #{count + 1} / 12"

  if role == "B"
    new_game.player_round()
  else
    new_game.computer_round()
  end
  count += 1
end

#Display end game message
if (new_game.win_condition())
  puts "Awesome! You cracked the code!"
else
  puts "You lose! The code was #{new_game.colorize_code(new_game.creator.code.code)} Better luck next time :)"
end
