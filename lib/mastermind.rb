require 'pry'
class Mastermind
  attr_reader :answer, :guess
  def initialize
    @answer = ""
    @guess = ""
  end


  def get_guess(guess = nil)
    if guess == nil
      @guess = gets.chomp.downcase
    else @guess = guess.downcase
    end
    guess_actions
  end

  def guess_actions
    if guess == "q" || guess == "quit"
      quit_mastermind
    elsif guess == "c" || guess == "cheat"
      get_cheat
    elsif guess.length < sequence.length
      p "Too short!"
    elsif guess.length > sequence.length
      p"Too long!"
    else puts "I don't know how to #{guess}."
    end
  end

  def quit_mastermind
    "Good Bye!"
  end

  def get_cheat
    puts answer
  end

  def sequence
    possible = ["r","g","b","y"]
    @answer = (possible * 4).shuffle.take(4).join("")
  end


end
