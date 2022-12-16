require 'set'

message = File.read('Day6/input.txt', chomp: true)
message_cons = message.split('').each_cons(4).to_a

found_idx = 0
message_cons.each_with_index do |a, i|
  if a.to_set.length == a.length
    found_idx = i
    break
  end
end
# idx is the first of the 4 characters, so we add 4
puts found_idx + 4

message_cons_part2 = message.split('').each_cons(14).to_a

found_idx_part2 = 0
message_cons_part2.each_with_index do |a, i|
  if a.to_set.length == a.length
    found_idx_part2 = i
    break
  end
end
# idx is the first of the 4 characters, so we add 4
puts found_idx_part2 + 14
