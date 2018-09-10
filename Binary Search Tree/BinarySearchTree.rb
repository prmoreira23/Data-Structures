require_relative "Node"

class BinarySearchTree
  def initialize
    @root = nil
    @count = 0
  end

  def insert(value)
    unless @root
      @root = Node.new(value)
    else
      insert_node(@root, value)
    end
    @count += 1
  end

  def contains(value)
    contain(@root, value)
  end

  def remove(value)
    node_to_remove = find_node(@root, value)
  end

  private
  def find_node(root, value)
    return nil unless root
    if root.value == value
      return root
    elsif value < root.value
      return find_node(root.left, value)
    else
      return find_node(root.right, value)
    end
  end

  def contain(root, value)
    return false unless root
    if root.value == value
      return true
    elsif value < root.value
      return contain(root.left, value)
    else
      return contain(root.right, value)
    end
  end

  def insert_node(current, value)
    if value < current.value # Left
      unless current.left
        current.left = Node.new(value)
      else
        insert_node(current.left, value)
      end
    else # Right
      unless current.right
        current.right = Node.new(value)
      else
        insert_node(current.right, value)
      end
    end
  end
end
