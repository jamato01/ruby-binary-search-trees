require_relative 'lib/tree'
require_relative 'lib/node'

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
test_tree = Tree.new(arr)
test_tree.pretty_print