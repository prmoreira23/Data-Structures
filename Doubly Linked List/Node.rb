class Node
  attr_accessor :value, :next, :previous

  def initialize(value)
    @value = value
    @next = nil
    @previous = nil
  end
end
