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
end