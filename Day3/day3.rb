def priority_for_item(item)
  if item == item.upcase
    item.ord - 38
  else
    item.ord - 96
  end
end

rucksacks = File.readlines('Day3/input.txt', chomp: true)
result = rucksacks.map do |r|
  sublists = r[0...r.length / 2], r[r.length / 2...r.length]
  intersect = sublists[0].split('') & sublists[1].split('')
  priority_for_item(intersect[0])
end
print result.sum

groups_of_three = rucksacks.each_slice(3).to_a
group_result = groups_of_three.map do |g|
  intersect = g[0].split('') & g[1].split('') & g[2].split('')
  priority_for_item(intersect[0])
end
print group_result
