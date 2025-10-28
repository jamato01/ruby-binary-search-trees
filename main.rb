require_relative "lib/tree"
require_relative "lib/node"

system("clear")

# Step 1
puts "Building the original tree using an array of 15 random numbers 1-100:"
test_tree = Tree.new(Array.new(15) { rand(1..100) })
test_tree.pretty_print

# Step 2
puts "\nIs the tree balanced? #{test_tree.balanced?}"

# Step 3
puts "\nDifferent traversal methods give the following arrays:"
puts "\nLevel Order (Breadth First):"
puts "#{test_tree.level_order}"
puts "\nPreorder (Depth First):"
puts "#{test_tree.preorder}"
puts "\nInorder (Depth First):"
puts "#{test_tree.inorder}"
puts "\nPostorder (Depth First):"
puts "#{test_tree.postorder}"

# Step 4
puts "\nUnbalancing the tree by adding 232, 345, and 456 gives:"
test_tree.insert(232)
test_tree.insert(345)
test_tree.insert(456)
test_tree.pretty_print

# Step 5
puts "\nIs the tree balanced? #{test_tree.balanced?}"

# Step 6
puts "\nRebalancing the tree:"
test_tree.rebalance.pretty_print

# Step 7
puts "\nIs the tree balanced? #{test_tree.balanced?}"

# Step 8
puts "\nDifferent traversal methods give the following arrays:"
puts "\nLevel Order (Breadth First):"
puts "#{test_tree.level_order}"
puts "\nPreorder (Depth First):"
puts "#{test_tree.preorder}"
puts "\nInorder (Depth First):"
puts "#{test_tree.inorder}"
puts "\nPostorder (Depth First):"
puts "#{test_tree.postorder}"

puts "\nWe now have our very own Balanced Binary Search Tree object in Ruby!"
