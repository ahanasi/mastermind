class Guesser
  attr_reader :guess

  def initialize(guess = [])
    @guess = guess
  end

  def build_guess(str)
    @guess = []
    @guess = str.split(//)
  end
end
