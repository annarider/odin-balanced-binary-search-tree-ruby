# frozen_string_literal: true

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
    @root = build_tree
  end

  def build_tree
    
  end
end
