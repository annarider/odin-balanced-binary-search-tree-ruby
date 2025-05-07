# frozen_string_literal: true

# TestNode contains the tests
# to check the Node class and
# Comparable mixin were correctly
# defined in this balanced BST project.
#
require_relative '../lib/node'

module TestNode
  class << self
    attr_accessor :node1, :node2, :node3
  end

  def self.setup
    @node1 = Node.new(13)
    @node2 = Node.new(13)
    @node3 = Node.new(1)
  end

  def self.compare
    p node1 == node2
    p node2 == node3
    p node2 > node3
  end

  def self.next_nil?
    p node1.left.nil?
    p node1.left
  end
end

if __FILE__ == $PROGRAM_NAME
  TestNode.setup
  # TestNode.compare
  TestNode.next_nil?
end
