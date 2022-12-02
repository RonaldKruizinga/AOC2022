def get_score_for_result(result)
  result * 3
end

def get_score(other_action, my_action)
  score = my_action
  result = ((my_action - other_action % 3) + 1) % 3
  score + get_score_for_result(result)
end

def get_score_targeted(other_action, my_targeted_result)
  score = get_score_for_result(my_targeted_result)
  score + ((other_action + (my_targeted_result - 2)) % 3) + 1
end

rps_inputs = File.readlines('Day2/input.txt', chomp: true)

puts rps_inputs.each(&:split).map { |a| get_score(a[0].ord - 64, a[2].ord - 87) }.sum # map to 1,2,3 and 1,2,3
puts rps_inputs.each(&:split).map { |a| get_score_targeted(a[0].ord - 64, a[2].ord - 88) }.sum # map to 1,2,3 and 0,1,2
