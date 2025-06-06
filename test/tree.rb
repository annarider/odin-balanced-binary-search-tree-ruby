# frozen_string_literal: true

# TestTree tests the Tree class
# is correctly defined in my
# Balanced Binary
# Search Tree project.
#
require_relative '../lib/tree'

module TestTree
  class << self
    attr_accessor :tree
  end

  def self.setup
    @tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
    tree.pretty_print
  end

  def self.insert
    tree.insert(45)
    tree.insert(145)
    tree.insert(5)
    tree.pretty_print
  end

  def self.delete
    tree.delete(45)
    tree.delete(145)
    tree.delete(5)
    tree.delete(4)
    tree.delete(8)
    tree.delete(67)
    tree.pretty_print
  end

  def self.find
    p tree.find(5)
    p tree.find(8)
    p tree.find(145)
    p tree.find(133)
  end

  def self.level_order
    # p tree.level_order
    # p tree.level_order { |node| puts node.data }
    p tree.level_order_r
    tree.level_order_r { |node| puts node.data }
  end

  def self.traverse
    p tree.inorder
    tree.inorder { |node| puts node.data }
    p tree.preorder
    tree.preorder { |node| puts node.data }
    p tree.postorder
    tree.postorder { |node| puts node.data }
  end

  def self.height
    p tree.height
    p tree.height(45)
    p tree.height(133)
    p tree.height(9)
    p tree.height(67)
  end

  def self.depth
    p tree.depth(8) # 0
    p tree.depth(45) # 4
    p tree.depth(133) # nil
    p tree.depth(9) # 2
    p tree.depth(67) # 1
  end

  def self.balanced?
    tree.balanced?
  end

  def self.rebalance
    @tree = tree.rebalance
    tree.pretty_print
    p "balanced? #{tree.balanced?}"
  end
end

if __FILE__ == $PROGRAM_NAME
  TestTree.setup
  puts "Before insert, balance? #{TestTree.balanced?}"
  TestTree.rebalance
  TestTree.insert
  puts "After insert, balance? #{TestTree.balanced?}"
  # TestTree.delete
  # TestTree.find
  # TestTree.level_order
  # TestTree.traverse
  # TestTree.height
  # TestTree.depth
  TestTree.rebalance
end
