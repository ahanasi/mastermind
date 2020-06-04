require_relative "secretcode.rb"

class Guesser
  attr_reader :guess

  def initialize(guess = SecretCode.new())
    @guess = guess
  end

end
