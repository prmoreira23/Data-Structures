require_relative "Node"

class DoublyLinkedList
  attr_reader :nodes

  def initialize
    @head = nil
    @tail = nil
    @nodes = []
  end

  def size
    @nodes.size
  end

  def add(value)
    node = Node.new(value)
    unless @head
      @head = node
      @tail = node
    else
      @tail.next = node
      node.previous = @tail
      @tail = node
    end
    nodes.push(node)
  end

  def contains(value)
    node = @head
    while node && node.value != value
      node = node.next
    end
    node == nil ? false : true
  end

  def remove(value)
    return false unless @head
    if @head.value == value
      @nodes.delete(@head)
      if @head == @tail
        @head = nil
        @tail = nil
      else
        @head = @head.next
        @head.previous = nil
      end
      return true
    end

    node = @head.next
    while node && node.value != value
      node = node.next
    end

      if node == @tail
        @nodes.delete(@tail)
        @tail = @tail.previous
        @tail.next = nil
        return true
      elsif node
        @nodes.delete(node)
        node.previous.next = node.next
        node.next.previous = node.previous
        return true
      end
    return false
  end

  def traverse
    node = @head
    while node
      yield node.value
      node = node.next
    end
  end

  def reverse_traversal
    node = @tail
    while node
      yield node.value
      node = node.previous
    end
  end
end
