cleanup_ranges = File.readlines('Day4/input.txt', chomp: true).map { |r| r.split(',').map{ |s| s.split('-').map(&:to_i) } }
matches = cleanup_ranges.map do |r|
    range1 = (r[0][0]..r[0][1])
    range2 = (r[1][0]..r[1][1])
    (range1.cover?(range2) || range2.cover?(range1) ? 1 : 0)
end
print matches.sum

overlaps = cleanup_ranges.map do |r|
  range1 = (r[0][0]..r[0][1]).to_a
  range2 = (r[1][0]..r[1][1]).to_a
  (range1 & range2).!empty? ? 1 : 0
end
print overlaps.sum
