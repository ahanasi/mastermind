require_relative "secretcode.rb"
require "colorize"
require "pry"

class Guesser
  attr_reader :guess

  def initialize(guess = SecretCode.new())
    @guess = guess
  end

  def guess_code(feedback)
    prev_guess = @guess.code
    
    @guess.code = SecretCode.new().generate_code

    green_idx = []
    green_idx = feedback.split(//).each_index.select { |i| feedback.split(//)[i] == "1" }
    green_idx.each { |i| @guess.code[i] = prev_guess[i] }

  end
end
