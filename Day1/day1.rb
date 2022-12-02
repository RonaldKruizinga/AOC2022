list_of_sums = File.readlines('Day1/input.txt', "\n\n").map { |s| s.rstrip.split("\n").map(&:to_i) }.map(&:sum)
puts list_of_sums.max

puts list_of_sums.sort!.reverse!.take(3).sum
