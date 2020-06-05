require_relative "secretcode.rb"
require "colorize"
require "set"
require "pry"

class Creator
  attr_accessor :code
  attr_accessor :feedback
  attr_accessor :feedback_num

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

    combo_arr.each_with_index do |val, i|
      if val[0] == val[1]
        green_count += 1
        to_delete.push([val[0], val[1]])
      end
    end

    to_delete.each_with_index { |val, idx| combo_arr.delete(to_delete[idx]) }
    guess_arr = []

    combo_arr.each do |a, b|
      guess_arr.push(b)
    end

    white_count = guess_arr.uniq.count{|i| @code.code.include?(i)}
    green_count.times { @feedback.concat("\u{26AB}".green); @feedback_num.concat("1")}
    white_count.times { @feedback.concat("\u{26AB}"); @feedback_num.concat("2")}
  end
end

test = Creator.new()
test.code.code = ["R","R","R","R"]
lol = test.give_feedback(["G","B","M","C"])
test.feedback_num