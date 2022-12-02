puts File.readlines('Day1/input.txt', "\n\n").map { |s| s.rstrip.split("\n").map(&:to_i) }.map(&:sum).max
