# This class creates a Binary Search Tree, which has nodes
class Tree
  
  def initialize(arr)
    arr.sort!.uniq!
    @root = build_tree(arr)
  end

  def build_tree(arr, start_index = 0, end_index = arr.length)
    return nil if start_index > end_index
      
    mid = start_index + (end_index - start_index) / 2
    root = Node.new(arr[mid])

    root.left_node = build_tree(arr, start_index, mid - 1)
    root.right_node = build_tree(arr, mid + 1, end_index)
  
    return root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
  pretty_print(node.right_node, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_node
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left_node, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_node
  end

end