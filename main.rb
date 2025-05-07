# frozen_string_literal: true

# main contains the main execution
# for running my Balanced Binary
# Search Tree project.
#
require_relative 'lib/tree'

class Main
attr_accessor :tree

@tree = Tree.new((Array.new(15) { rand(1..100) }))

def self.tree
  @tree
end

def self.print_all_elements
  puts "level iteratively: #{tree.level_order}"
  puts "level recursively: #{tree.level_order_r}"
  
  puts "inorder: #{tree.inorder}"
  puts "preorder: #{tree.preorder}"
  puts "postorder: #{tree.postorder}"
  puts 'insert new values'
end

def self.balance
  tree.pretty_print
  puts "balanced? #{tree.balanced?}"  
end

def self.unbalance
  tree.insert(rand(100...1000))
  tree.insert(rand(100...1000))
  tree.insert(rand(100...1000))
  puts "balanced? #{tree.balanced?}"
end

def self.rebalance
  tree.rebalance
end
end

if __FILE__ == $PROGRAM_NAME
  Main.print_all_elements
  Main.balance
  Main.print_all_elements
  Main.unbalance
  Main.rebalance
  Main.balance
  Main.print_all_elements
end
