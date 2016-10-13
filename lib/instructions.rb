require "pry"

class Instructions

  def greeting
    puts "Welcome to Mastermind"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

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
end
