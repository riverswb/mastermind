require 'pry'
class Mastermind

  def get_guess
    guess = gets.chomp.downcase
    if guess == "q" || guess == "quit"
      quit_mastermind
    end
  end

  def quit_mastermind
    "Good Bye!"
  end

  def get_cheat

  end


end
