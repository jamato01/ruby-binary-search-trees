# This class creates a node, with left and right children data
class Node
  include Comparable
  attr_accessor :root, :left_node, :right_node

  def initialize(root, left_node = nil, right_node = nil)
    @root = root
    @left_node = left_node
    @right_node = right_node
  end

  def <=>(other)
    root <=> other.root
  end
end