def is_visible?(column, row, trees)
  my_height = trees[row][column]

  highest_north = -1
  highest_east = -1
  highest_south = -1
  highest_west = -1

  (0...trees.length).each do |y|
    tree_height = trees[y][column]

    highest_north = tree_height if y < row && tree_height > highest_north
    highest_south = tree_height if y > row && tree_height > highest_south
  end

  (0...trees[0].length).each do |x|
    tree_height = trees[row][x]

    highest_west = tree_height if x < column && tree_height > highest_west
    highest_east = tree_height if x > column && tree_height > highest_east
  end
  my_height > highest_north || my_height > highest_east || my_height > highest_south || my_height > highest_west
end

def get_scenic_score(column, row, trees)
  my_height = trees[row][column]
  count_north = 0
  count_east = 0
  count_south = 0
  count_west = 0

  (0...row).reverse_each do |y|
    tree_height = trees[y][column]
    count_north += 1 if tree_height < my_height
    if tree_height >= my_height
      count_north += 1
      break
    end
  end

  (row + 1...trees.length).each do |y|
    tree_height = trees[y][column]
    count_south += 1 if tree_height < my_height
    if tree_height >= my_height
      count_south += 1
      break
    end
  end
  
  (0...column).reverse_each do |x|
    tree_height = trees[row][x]
    count_west += 1 if tree_height < my_height
    if tree_height >= my_height
      count_west += 1
      break
    end
  end

  (column + 1...trees[0].length).each do |x|
    tree_height = trees[row][x]

    count_east += 1 if tree_height < my_height
    if tree_height >= my_height
      count_east += 1
      break
    end
  end
  
  count_west * count_east * count_north * count_south
end

trees_rows = File.readlines('Day8/input.txt', chomp: true)
trees = trees_rows.map { |row| row.split('').map(&:to_i) }

visible_count = 0
highest_scenic_score = 0
trees.each_with_index do |y, j|
  y.each_with_index do |x, i|
    visible_count += is_visible?(i, j, trees) ? 1 : 0
    scenic_score = get_scenic_score(i, j, trees)

    highest_scenic_score = scenic_score if scenic_score > highest_scenic_score
  end
end

puts visible_count
puts highest_scenic_score
