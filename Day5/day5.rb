layout, actions = File.readlines('Day5/input.txt', "\n\n")
layout.gsub! '    ', ' [] '

rows = layout.split("\n").map(&:split)
column_count = rows.pop.last.to_i

columns = []
columns_part2 = []
(1..column_count).each do |a|
  columns[a] = rows.reverse.map { |x| x[a - 1] }.filter { |x| x != '[]' }
  columns_part2[a] = rows.reverse.map { |x| x[a - 1] }.filter { |x| x != '[]' }
end

movements = actions.split("\n").map { |a| a.scan(/\d+/).map(&:to_i) }
movements.each do |amount, from, to|
  columns[to].concat columns[from].pop(amount).reverse
end
print columns.drop(1).map { |x| x[-1].scan(/\w+/) }.join

movements.each do |amount, from, to|
  columns_part2[to].concat columns_part2[from].pop(amount)
end
print columns_part2.drop(1).map { |x| x[-1].scan(/\w+/) }.join
