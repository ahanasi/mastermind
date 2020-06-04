require_relative "secretcode.rb"
require "colorize"
require "set"
require "pry"

class Creator
  attr_accessor :code
  attr_reader :feedback
  attr_reader :feedback_num

  def initialize(code = SecretCode.new(), feedback = "", feedback_num = "")
    @code = code
    @feedback = feedback
    @feedback_num = feedback_num
  end

  def give_feedback(guess)
    @feedback = ""
    @feedback_num = ""
    green_count = 0
    white_count = 0
    to_delete = []
    combo_arr = @code.code.zip(guess)
    guess_dup = guess.dup

    combo_arr.each do |a, b|
      if a == b
        green_count += 1
        to_delete.push([a, b])
      end
    end

    to_delete.each_with_index { |val, idx| combo_arr.delete(to_delete[idx]) }

    combo_arr.each do |a, b|
      if guess_dup.include?(a)
        white_count += 1
      end
    end

    green_count.times { feedback.concat("\u{26AB}".green); feedback_num.concat("1") }
    white_count.times { feedback.concat("\u{26AB}"); feedback_num.concat("0") }
    @feedback
  end
end
