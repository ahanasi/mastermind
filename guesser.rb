require_relative "secretcode.rb"
require "colorize"
require "pry"

class Guesser
  attr_reader :guess

  def initialize(guess = SecretCode.new())
    @guess = guess
  end

  def guess_code(feedback = "")
    prev_guess = @guess.code
    @guess.code = SecretCode.new().generate_code
    if (feedback.split(//).include?("1"))
      idx = feedback.split(//).index("1")
      @guess.code[idx] = prev_guess[idx]
      binding.pry
    end
    @guess
    binding.pry
  end
end
