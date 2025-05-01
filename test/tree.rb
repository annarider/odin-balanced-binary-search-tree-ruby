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
  end
end

if __FILE__ == $PROGRAM_NAME
  p TestTree.setup
end
