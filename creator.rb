require_relative "secretcode.rb"
require "colorize"
require "set"
require "pry"

class Creator
  attr_accessor :code
  attr_reader :feedback

  def initialize(code = SecretCode.new(), feedback = "")
    @code = code
    @feedback = feedback
  end

  def generate_code()
    code_arr = ["R", "G", "Y", "B", "M", "C"]
    @code = 4.times.map { code_arr.sample }
  end

  def build_code(str)
    @code = []
    @code = str.split(//)
  end

  def give_feedback(guess)
    @feedback = ""
    green_count = 0
    white_count = 0
    to_delete = []
    combo_arr = @code.zip(guess)
    guess_dup = guess.dup

    combo_arr.each do |a,b| 
      if a==b
        green_count += 1
        to_delete.push([a,b])
      end
    end

    to_delete.each_with_index {|val,idx| combo_arr.delete(to_delete[idx])}
    
    combo_arr.each do |a,b|
      if guess_dup.include?(a) 
        white_count += 1
      end
    end 

    green_count.times {feedback.concat("\u{26AB}".green)}
    white_count.times {feedback.concat("\u{26AB}")}
    puts @feedback
  end
end