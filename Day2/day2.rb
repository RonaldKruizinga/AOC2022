require 'ruby-enum'

class RESULT
  include Ruby::Enum

  define :LOSS, 1
  define :DRAW, 2
  define :WIN, 3
end

class ACTION
  include Ruby::Enum
  
  define :ROCK, 1
  define :PAPER, 2
  define :SCISSORS, 3
end

def draw?(other_action, my_action)
  other_action == my_action
end

def win?(other_action, my_action)
  (other_action == ACTION::SCISSORS && my_action == ACTION::ROCK) || (my_action == other_action + 1)
end

def get_score_for_result(result)
  (result - 1) * 3
end

def get_score(other_action, my_action)
  score = my_action
  if draw?(other_action, my_action)
    score + get_score_for_result(RESULT::DRAW)
  elsif win?(other_action, my_action)
    score + get_score_for_result(RESULT::WIN)
  else
    score
  end
end

def get_points_for_targeted_loss(other_action)
  if other_action == ACTION::ROCK
    ACTION::SCISSORS
  else
    other_action - 1
  end
end

def get_points_for_targeted_win(other_action)
  if other_action == ACTION::SCISSORS
    ACTION::ROCK
  else
    other_action + 1
  end
end

def get_score_targeted(other_action, my_targeted_result)
  score = get_score_for_result(my_targeted_result)
  case my_targeted_result
  when RESULT::DRAW
    score + other_action
  when RESULT::LOSS
    score + get_points_for_targeted_loss(other_action)
  else
    score + get_points_for_targeted_win(other_action)
  end
end

rps_inputs = File.readlines('Day2/input.txt', chomp: true)

puts rps_inputs.each(&:split).map { |a| get_score(a[0].ord - 64, a[2].ord - 87) }.sum
puts rps_inputs.each(&:split).map { |a| get_score_targeted(a[0].ord - 64, a[2].ord - 87) }.sum
