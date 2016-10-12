
class Difficulty

  def difficulty_level
    puts "Choose your difficulty: (B)eginner, (I)ntermediate, (A)dvanced"
  end

  def get_answer_beginner
    possible = ["r","g","b","y"]
    (possible * 4).shuffle.take(4).join
  end

  def get_answer_intermediate
    possible = ["r","g","b","y","w"]
    (possible * 6).shuffle.take(6).join
  end

  def get_answer_advanced
    possible = ["r","g","b","y","w","p"]
    (possible * 8).shuffle.take(8).join
  end
end
