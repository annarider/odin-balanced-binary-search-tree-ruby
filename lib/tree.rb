# frozen_string_literal: true

require_relative 'node'

# Tree class builds a balanced
# binary search tree. It contains
# methods to manipulate data,
# such as searching, inserting,
# and deleting.
# 
# It relies on the Node
# class to create nodes in
# the tree.
#
# @example Create a new Tree
# tree = Tree.new
#
class Tree
  attr_accessor :root

  def initialize(array = [])
    @root = build_tree(array.sort.uniq)
  end

  def build_tree(array)
    start_index = 0
    end_index = array.length - 1
    return nil if array.empty?

    middle_index = (start_index + end_index) / 2
    root = Node.new(array[middle_index])
    root.left = build_tree(array[0...middle_index])
    root.right = build_tree(array[(middle_index + 1)..])
    root
  end

  def insert(key, node = @root)
    # handle 2 base cases
    return Node.new(key) if node.nil?

    return node if node.data == key

    if node.data < key
      node.right = insert(key, node.right)
    else
      node.left = insert(key, node.left)
    end
    node
  end

  def delete(key, node = @root)
    return nil if node.nil? # handle base case

    # traverse down subtrees to find key in a leaf node
    if node.data > key
      node.left = delete(key, node.left) # search left subtree
    elsif node.data < key
      node.right = delete(key, node.right) # search right subtree
    else
      # Found node with key, logic to delete covers 3 cases
      # node to delete is leaf node or only has right child
      return node.right if node.left.nil?

      # node only has a left child
      return node.left if node.right.nil?
      
      # when node to delete has left and right children
      replacement = successor(node)
      node.data = replacement.data
      node.right = delete(replacement.data, node.right)
    end
    node
  end

  def find(key, node = @root)
    # base case
    return node if node.nil? || node.data == key
    
    return find(key, node.left) if node.data > key

    return find(key, node.right) if node.data < key
      
    nil
  end

  def level_order
    return nil if root.nil?

    queue = [root]
    data = []
    until queue.empty?
      current = queue.shift
      data << current.data 
      yield current if block_given?
      queue.push(current.left) unless current.left.nil?
      queue.push(current.right) unless current.right.nil?
    end
    data unless block_given?
  end
  
  def level_order_r(queue = [@root], data = [], &block)
    # base case
    return data if queue.empty?
    
    current = queue.shift
    data << current.data
    yield current if block_given?
    queue << current.left unless current.left.nil?
    queue << current.right unless current.right.nil?
    level_order_r(queue, data, &block)

    block_given? ? nil : data
  end

  def inorder(node = @root, data = [], &block)
    return node if root.nil?

    current = node
    inorder(current.left, data, &block) unless current.left.nil?
    yield current if block_given?
    data << current.data
    inorder(current.right, data, &block) unless current.right.nil?

    block_given? ? nil : data
  end

  def preorder(node = @root, data = [], &block)
    return node if root.nil?

    current = node
    yield current if block_given?
    data << current.data
    preorder(current.left, data, &block) unless current.left.nil?
    preorder(current.right, data, &block) unless current.right.nil?

    block_given? ? nil : data
  end

  def postorder(node = @root, data = [], &block)
    return node if root.nil?

    current = node
    postorder(current.left, data, &block) unless current.left.nil?
    postorder(current.right, data, &block) unless current.right.nil?
    yield current if block_given?
    data << current.data
    block_given? ? nil : data
  end

  def height(key, node = @root)
    current = find(key)
    return nil if current.nil?
    # base case
    return 0 if node.nil? || node.data == key

  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end 

  private

  def successor(node)
    current = node.right
    until current.nil? || current.left.nil?
      current = current.left
    end
    current
  end
end
