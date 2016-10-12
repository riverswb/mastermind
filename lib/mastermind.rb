require 'pry'
class Mastermind
  attr_reader :answer,:guess_count, :positions, :elements
  attr_accessor :guess, :answer
  def initialize
    @answer = ""
    @guess = guess
    @guess_count = 0
    @elements = 0
    @positions = 0
  end


  def get_guess
    @guess = gets.chomp.downcase
    guess_actions
  end

  def guess_actions
    if guess == "q" || guess == "quit"
      quit_mastermind
    elsif guess == "c" || guess == "cheat"
      get_cheat
      # get_guess
    elsif guess == answer
      end_game
    elsif guess.length < sequence.length
      p "Too short!"
      # get_guess
    elsif guess.length > sequence.length
      p "Too long!"
      # get_guess
    elsif guess != answer
        feedback
    else
      puts "I don't know how to #{guess}."
    end
    # get_guess
  end

  def quit_mastermind
    p "Good Bye!"
  end

  def get_cheat
    puts answer
    p "Cheater!"
  end

  def sequence
    possible = ["r","g","b","y"]
    @answer = (possible * 4).shuffle.take(4).join("")
  end

  def end_game
    @guess_count += 1
    p "Congratulations!"
  end

  def feedback
    @guess_count += 1
    sequence = answer.chars
    guess_colors = guess.chars
    guess_colors.each do |color|
      sequence.include?(color)
      (p = sequence.find_index(color)) && sequence.delete_at(p)
    end
    @elements = answer.length - sequence.length
    @positions = guess.chars.zip(answer.chars).count do |n|
      n[0] == n[1]
    end

    p "'#{guess.upcase}' has #{elements} of the correct elements with #{positions} in the correct positions"
    p  "You've taken #{guess_count} guess"
    p "feedback"
    # get_guess
  end
# Mastermind.new.get_guess

end
