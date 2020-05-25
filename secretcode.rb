require "colorize"

class SecretCode
  attr_reader :code

  def initialize(code = Array.new(4))
    @code = code
  end
end
