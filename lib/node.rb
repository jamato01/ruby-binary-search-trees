# This class creates a node, with left and right children data
class Node
  include Comparable

  attr_accessor :data, :left_node, :right_node

  def initialize(data, left_node = nil, right_node = nil)
    @data = data
    @left_node = left_node
    @right_node = right_node
  end

  def <=>(other)
    data <=> other.data
  end

  def pretty_print(node = self, prefix = "", is_left = true)
    pretty_print(node.right_node, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_node
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_node, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_node
  end
end
