# frozen_string_literal: true

# main contains the main execution
# for running my Balanced Binary
# Search Tree project.
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
end

if __FILE__ == $PROGRAM_NAME
  TestNode.setup
  TestNode.compare
end
