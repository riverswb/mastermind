require 'pry'
require "./lib/instructions.rb"
require './lib/difficulty.rb'

class Mastermind
  attr_reader :guess,
              :positions,
              :elements,
              :guess_count,
              :start_time,
              :instructions,
              :difficulty,
              :difficulty_level
  attr_accessor :sequence
  def initialize
    @sequence = ''
    @guess = ""
    @positions = 0
    @elements = 0
    @guess_count = 0
    @start_time = nil
    @instructions = Instructions.new
    @difficulty = Difficulty.new
    @difficulty_level = ""
  end

  def difficulty_level
    @difficulty_level
  end
  
  def run_mastermind
    choose_difficulty
    instructions.greeting
    @start_time = Time.now
    repl
  end

    def choose_difficulty
      difficulty.difficulty_level
      @difficulty_level = gets.chomp.downcase
      # instructions.play_instructions
    end


  # def start_time
  #   @start_time = Time.now
  # end


  def repl
    print "> "
    input = gets.chomp.downcase
    if input == "q" || input == "quit"
      instructions.quit_mastermind
    elsif input == "p" || input == "play"
      start_time
        if difficulty_level == "b"
          @sequence = difficulty.get_sequence_beginner
          play_mastermind
        elsif difficulty_level == "i"
          @sequence = difficulty.get_sequence_intermediate
          play_mastermind
        elsif difficulty_level == "a"
          @sequence = difficulty.get_sequence_advanced
          play_mastermind
        else
        end
    elsif input == "i" || input == "instructions"
      instructions.mastermind_general_instructions
      run_mastermind
    else
      puts "I'm sorry, I don't know how to #{input}!"
    end
  end

  def play_mastermind
    binding.pry
    instructions.play_instructions
    print "> "
    @guess = gets.chomp.downcase
    if guess == "q" || guess == "quit"
      instructions.quit_mastermind
    elsif guess == "c" || guess == "cheat"
      puts sequence
      play_mastermind
    elsif guess.length < sequence.length
      puts "Guess to short!"
      play_mastermind
    elsif guess.length > sequence.length
      puts "Guess to long!"
      play_mastermind
    elsif guess == sequence
      @guess_count += 1
      end_game
    elsif guess != sequence
      feedback
      play_mastermind
      # puts "#{guess.upcase} has #{elements} of the correct elements with #{positions} in the correct positions"
      # puts "You've taken #{guess_count} guess(es)"
    end
  end

  def feedback
    @guess_count += 1
    input = guess.chars
    answer = sequence.chars
    input.each do |i|
      answer.include?(i)
      (p = answer.find_index(i)) && answer.delete_at(p)
    end
    @elements = sequence.length - answer.length
    answer = sequence.chars
    @positions = input.zip(answer).count do |n|
      n[0] == n[1]
    end
      puts "'#{guess.upcase}' has #{elements} of the correct elements with #{positions} in the correct positions"
      puts "You've taken #{guess_count} guess(es)"
  end

  def end_game
    end_time = Time.now
    time = (((end_time - start_time) / 60).divmod 1)
    minutes = time[0]
    seconds = (time[1] * 60).round
    puts "Congratulations! You guessed the sequence '#{sequence.upcase}' in #{guess_count} guesses over #{minutes.abs} minutes and #{seconds.abs} seconds."
    puts "Do you want to (p)lay again or (q)uit?"
    input = gets.chomp
    if input == "q" || input == "quit"
      instructions.quit_mastermind
    elsif input == "p" || input == "play"
      @guess_count = 0
      run_mastermind
    else
      puts "I'm sorry, I don't know how to #{input}, game over."
    end
  end

end

Mastermind.new.run_mastermind
