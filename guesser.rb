class Guesser
  attr_reader :guess

  def initialize(guess = [])
    @guess = guess
  end

  def build_guess(str)
    @guess = []
    if str.include? " "
      str.gsub!(/\s+/, "")
    end
    @guess = str.split(//)
  end
end
