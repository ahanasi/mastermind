require_relative "secretcode.rb"

class Creator
  attr_reader :code
  attr_reader :key

  def initialize(code = SecretCode.new(), key = [])
    @code = code
    @key = key
  end

  def generate_code()
    code_arr = ["R", "G", "Y", "B", "M", "C"]
    @code = 4.times.map { code_arr.sample }
  end
end

test = Creator.new()
test.generate_code()
