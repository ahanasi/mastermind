require "colorize"

class SecretCode
  attr_accessor :code

  def initialize(code = Array.new(4))
    @code = code
  end

  def build_code(str)
    @code = []
    @code = str.split(//)
  end

  def generate_code()
    code_arr = ["R", "G", "Y", "B", "M", "C"]
    @code = 4.times.map { code_arr.sample }
  end

end
