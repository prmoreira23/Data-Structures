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

  def contains(value)
    node = @head
    while node && node.value != value
      node = node.next
    end
    node == nil ? false : true
  end

  def remove(value)
    return false unless @head
    node = @head
    if node.value == value
      if @head == @tail
        @head = nil
        @tail = nil
      else
        @head = @head.next
      end
      return true
    end

    while node.next && node.next.value != value
      node = node.next
    end

    if node.next
      if node.next == @tail
        @tail = node
      end
      node.next = node.next.next
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
    if @tail
      current = @tail
      while current != @head
        prev = @head
        while prev.next != current
          prev = prev.next
        end
        yield current.value
        current = prev
      end
      yield current.value
    end
  end
end
