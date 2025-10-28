# This class creates a Binary Search Tree, which has nodes
class Tree
  
  def initialize(arr)
    arr.sort!.uniq!
    @root = build_tree(arr)
  end

  def build_tree(arr, start_index = 0, end_index = arr.length - 1)
    return nil if start_index > end_index
      
    mid = start_index + (end_index - start_index) / 2
    root = Node.new(arr[mid])

    root.left_node = build_tree(arr, start_index, mid - 1)
    root.right_node = build_tree(arr, mid + 1, end_index)
  
    return root
  end

  def insert(value, root = @root)
    return Node.new(value) if root.nil?

    if value < root.data
      root.left_node = insert(value, root.left_node)
    else
      root.right_node = insert(value, root.right_node)
    end

    root
  end

  def delete(value, root = @root)
    return root if root.nil?
    
    # Traverse tree
    if root.data > value
      root.left_node = delete(value, root.left_node)
    elsif root.data < value
      root.right_node = delete(value, root.right_node)
    else

      # Node with 0 or 1 children
      return root.right_node if root.left_node.nil?
      return root.left_node if root.right_node.nil?
        
      # Node with 2 children
      successor = get_successor(root)
      root.data = successor.data
      root.right_node = delete(successor.data, root.right_node)
    end

    root
  end

  def get_successor(root)
    current_node = root.right_node
    while !current_node.nil? && !current_node.left_node.nil?
      current_node = current_node.left_node
    end
    current_node
  end

  def find(value, root = @root)
    return root if root.nil?

    if root.data > value
      return find(value, root.left_node)
    elsif root.data < value
      return find(value, root.right_node)
    end

    root
  end

  def level_order(&block_arg)
    return_arr = []
    given_block = block_given? ? block_arg : Proc.new { |elem| return_arr << elem.data }
    queue = []
    queue << @root
    while !queue.empty?
      current_node = queue[0]
      given_block.call(queue[0])
      queue << current_node.left_node if !current_node.left_node.nil?
      queue << current_node.right_node if !current_node.right_node.nil?
      queue.shift
    end
    return_arr
  end

  def inorder(root = @root, return_arr = [], &block_arg)
    return root if root.nil?
    given_block = block_given? ? block_arg : Proc.new { |elem| return_arr << elem.data }
    inorder(root.left_node, return_arr, &given_block)
    given_block.call(root)
    inorder(root.right_node, return_arr, &given_block)
    return_arr
  end

  def preorder(root = @root, return_arr = [], &block_arg)
    return root if root.nil?
    given_block = block_given? ? block_arg : Proc.new { |elem| return_arr << elem.data }
    given_block.call(root)
    preorder(root.left_node, return_arr, &given_block)
    preorder(root.right_node, return_arr, &given_block)
    return_arr
  end

  def postorder(root = @root, return_arr = [], &block_arg)
    return root if root.nil?
    given_block = block_given? ? block_arg : Proc.new { |elem| return_arr << elem.data }
    postorder(root.left_node, return_arr, &given_block)
    postorder(root.right_node, return_arr, &given_block)
    given_block.call(root)
    return_arr
  end

  def height(value = @root.data)
    return nil if find(value).nil?
    this_node = find(value)
    height_traversal(this_node)
  end

  def height_traversal(root)
    if root.nil?
      return -1
    else
      left_height = height_traversal(root.left_node)
      right_height = height_traversal(root.right_node)
      return 1 + [left_height, right_height].max
    end
  end

  def depth(value, root = @root, depth = 0)
    return root if root.nil?

    if root.data > value
      return depth(value, root.left_node, depth + 1)
    elsif root.data < value
      return depth(value, root.right_node, depth + 1)
    end

    depth
  end

  def balanced?(root = @root)
    return_arr = []
    check_block = Proc.new do |elem|
      if !elem.right_node.nil? && !elem.left_node.nil?
        return_arr << ((height(elem.left_node.data) - height(elem.right_node.data)).abs <= 1)
      end
    end
    return_arr = inorder(root, return_arr, &check_block)
    return_arr.all?
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
  pretty_print(node.right_node, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_node
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left_node, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_node
  end

end