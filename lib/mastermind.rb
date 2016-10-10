require 'pry'
class Mastermind
  attr_reader :sequence,
              :guess,
              :positions,
              :elements,
              :guess_count,
              :start_time
  def initialize
    @sequence = ''
    @guess = ""
    @positions = 0
    @elements = 0
    @guess_count = 0
    @start_time = ""
  end
  def run_mastermind
    @start_time = Time.now
    greeting
    repl
  end

  def repl
    # input = gets.chomp.downcase
    #   quit_mastermind if input == "q" || input == "quit"
    #   (get_sequence && play_mastermind) if input == "p" || input == "play"
    #   (run_mastermind && mastermind_instructions) if input == "i" || input == "instructions"
    #    "I'm sorry, I don't know how to #{input}!" if input != "q" || input != "i" || input != "p"
    input = gets.chomp.downcase
    quit_mastermind if input == "q" || input == "quit"
    if input == "p" || input == "play"
      get_sequence
      play_mastermind
    elsif input == "i" || input == "instructions"
      mastermind_general_instructions
      run_mastermind
    else
      puts "I'm sorry, I don't know how to #{input}!"
    end
  end

  def play_mastermind
    play_instructions
    @guess = gets.chomp.downcase
    quit_mastermind if guess == "q" || guess == "quit"
    if guess == "c" || guess == "cheat"
      puts sequence
      play_mastermind
    elsif guess.length < 4
      puts "Guess to short!"
      play_mastermind
    elsif guess.length > 4
      puts "Guess to long!"
      play_mastermind
    elsif guess == sequence
      @guess_count += 1
      end_game
    elsif guess != sequence
      feedback
      puts "#{guess.upcase} has #{elements} of the correct elements with #{positions} in the correct positions"
      puts "You've taken #{guess_count} guess(es)"
        play_mastermind
    end
  end

  def play_instructions
    puts "\tI have generated a beginner sequence with four elements made up of:
      (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
      What's your guess?"
  end

  def mastermind_general_instructions
    puts "Make a guess of the sequence of colors, read the feedback after you guess to make a more accurate guess, until you get the correct sequence"
  end

  def quit_mastermind
    puts "Good Bye!"
  end

  def greeting
    puts "Welcome to Mastermind"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def get_sequence
    possible = ["r","r","r","r","g","g","g","g","b","b","b","b","y","y","y","y"]
    @sequence = possible.shuffle.take(4).join
  end

  def feedback
    @elements = 0
    @positions = 0
    @guess_count += 1
    poop = guess.split("")
    seq = sequence.split("")
    poop.each do |p|
      @elements += 1 if seq.include?(p)
    end
    poop.zip(seq).each do |n|
      @positions += 1 if n[0] == n[1]
    end
  end

  def end_game
    end_time = Time.now
    time = (((end_time - start_time) / 60).divmod 1)
    minutes = time[0]
    seconds = (time[1] * 60).round
    puts "Congratulations! You guessed the sequence #{sequence.upcase} in #{guess_count} guesses over #{minutes.abs} minutes and #{seconds.abs} seconds."
    puts "Do you want to (p)lay again or (q)uit?"
    input = gets.chomp
    quit_mastermind if input == "q" || input == "quit"
    if input == "p" || input == "play"
      @guess_count = 0
      run_mastermind
    else
      puts "I'm sorry, I don't know how to #{input}, game over."
    end
  end

end

Mastermind.new.run_mastermind
