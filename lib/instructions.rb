require "pry"

class Instructions

  def greeting
    puts "Welcome to Mastermind"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  # def play_instructions_beginner
  #
  #   puts "\tI have generated a beginner sequence with four elements made up of:
  #     (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
  #     What's your guess?"
  # end

  def mastermind_general_instructions
    puts "Make a guess of the sequence of colors, read the feedback after you guess to make a more accurate guess, until you get the correct sequence."

    puts "It's not that difficult..."
  end

  def winner!
    puts "Congratulations! You guessed the sequence #{@guess} in #{@guess_count} guesses over #{minutes.abs} minutes and #{seconds.abs} seconds."
    puts "Do you want to (p)lay again or (q)uit?"
  end

  def quit_mastermind
    puts "Good Bye!"
    exit
  end

  def play_instructions
    beg = "beginner" if @difficulty_level == "b"
    int = "intermediate" if @difficulty_level == "i"
    adv = "advanced" if @difficulty_level == "a"

    d = "four" if beg == "beginner"
    e = "six" if int == "intermediate"
    f = "eight" if adv == "advanced"



  puts "\tI have generated a #{beg}#{int}#{adv} sequence with #{d}#{e}#{f} elements made up of:
    (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
  end
end
