# frozen_string_literal: true

# Node defines a node in the
# Tree class. It contains
# the data value and points to
# the left and right child.
#
# It relies on the Comparable
# module (built into Ruby)
# to compare the data of 2 nodes.
#
# @example Create a new Node
# node = Node.new
#
class Node
  include Comparable

  attr_accessor :data, :left, :right

  def <=>(other)
    data <=> other.data
  end

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end
