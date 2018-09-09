require_relative "Node"

class SinglyLinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def add(value)
    node = Node.new(value)
    unless @head
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end
end
