class Instructions
  def play_instructions
    puts "\tI have generated a beginner sequence with four elements made up of:
      (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
      What's your guess?"
  end

  def quit_mastermind
    puts "Good Bye!"
  end

  def mastermind_general_instructions
    puts "Make a guess of the sequence of colors, read the feedback after you guess to make a more accurate guess, until you get the correct sequence"
  end

    def greeting
      puts "Welcome to Mastermind"
      puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    end

end
