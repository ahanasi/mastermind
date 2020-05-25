require 'colorize'
class SecretCode
  attr_accessor :code
  def initialize(code = Array.new(4))
    @code = code
  end
end

