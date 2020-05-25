class Guesser
  attr_reader :guess
  def initialize(guess=Array.new(4))
    @guess = guess
  end
ends