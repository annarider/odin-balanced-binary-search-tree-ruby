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
end
