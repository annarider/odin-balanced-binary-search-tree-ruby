# frozen_string_literal: true

# Node defines a node in the
# Tree class. It contains
# the data value and points to
# the left and right child.
#
# @example Create a new Node
# node = Node.new
#
class Node
  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end
