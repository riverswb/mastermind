require 'pry'
require './lib/instructions.rb'
require './lib/difficulty'

class Mastermind
  attr_reader :answer,
              :guess_count,
              :positions,
              :elements,
              :input,
              :instructions,
              :difficulty_level,
              :difficulty,
              :start_time
  attr_accessor :guess, :answer
  def initialize
    @answer = answer
    @guess = guess
    @guess_count = 0
    @elements = 0
    @positions = 0
    @input = input
    @instructions = Instructions.new
    @difficulty_level = difficulty_level
    @difficulty = Difficulty.new
    @start_time = start_time
  end

  def start_mastermind
    instructions.greeting
    @input = gets.chomp.downcase
    start_options
  end

  def start_options
    if input == "p" || input == "play"
      @start_time = Time.now
      choose_difficulty
        if difficulty_level == "b"
          @answer = difficulty.get_answer_beginner
        elsif difficulty_level == "i"
          @answer = difficulty.get_answer_intermediate
        elsif difficulty_level == "a"
          @answer = difficulty.get_answer_advanced
        else
          p "Try again!"
          start_mastermind
        end
        get_guess
    elsif input == "i" || input == "instructions"
      instructions.mastermind_general_instructions
      start_mastermind
    elsif input == "q" || input == "quit"
      quit_mastermind
    else
      p "I'm sorry, I don't know how to #{input}, please try again."
      start_mastermind
    end
  end

  def choose_difficulty
    difficulty.difficulty_level
    @difficulty_level = gets.chomp.downcase
  end

  def get_guess
    play_instructions
    @guess = gets.chomp.downcase
    guess_actions
  end

  def guess_actions
    if guess == "q" || guess == "quit"
      quit_mastermind
    elsif guess == "c" || guess == "cheat"
      get_cheat
      get_guess
    elsif guess == answer
      end_game
    elsif guess.length < answer.length
      p "Too short!"
      get_guess
    elsif guess.length > answer.length
      p "Too long!"
      get_guess
    elsif guess != answer
        feedback
    else
      puts "I don't know how to #{guess}."
      get_guess
    end
  end

  def difficulty_level
    @difficulty_level
  end

  def quit_mastermind
    p "Good Bye!"
    exit
  end

  def get_cheat
    p "Cheater! The answer is '#{answer.upcase}'"
  end

  # def sequence
  #   possible = ["r","g","b","y"]
  #   @answer = (possible * 4).shuffle.take(4).join("")
  # end

  def end_game
    @guess_count += 1
    end_time = Time.now
    time = (((end_time - start_time) / 60).divmod 1)
    minutes = time[0]
    seconds = (time[1] * 60).round
    p "Congratulations! You guessed the sequence '#{answer.upcase}' in #{guess_count} over #{minutes} minutes, #{seconds} seconds.
      Do you want to (p)lay again or (q)uit? "
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
    get_guess
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
Mastermind.new.start_mastermind
