require_relative "secretcode.rb"
require "colorize"

class Creator
  attr_reader :code
  attr_reader :feedback

  def initialize(code = SecretCode.new(), feedback = "")
    @code = code
    @feedback = feedback
  end

  def generate_code()
    code_arr = ["R", "G", "Y", "B", "M", "C"]
    @code = 4.times.map { code_arr.sample }
  end

  def give_feedback(guess)
    @feedback = ""
    guess.each_with_index do |val, i|
      if @code[i] == val && @code.include?(val)
        feedback.concat("\u{26AB}".green)
      elsif @code.include?(val)
        feedback.concat("\u{26AB}")
      end
    end
    puts @feedback
  end
end
