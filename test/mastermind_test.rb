require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind.rb'
require './lib/instructions.rb'
require "pry"
class MastermindTest < Minitest::Test

  def test_mastermind_exists
    assert Mastermind.new
  end

  def test_if_guess_is_q_or_quit_exit_game
    mm = Mastermind.new
    mm.guess = "q"

    assert_equal "Good Bye!", mm.guess_actions
  end

  def test_it_has_a_sequence
    mm = Mastermind.new

    assert_equal 4, mm.sequence.length
  end
  #
  def test_if_guess_is_c_or_cheat_print_the_sequence
    mm = Mastermind.new
    mm.guess = ("c")

    assert_equal "Cheater!", mm.guess_actions
  end

  def test_knows_if_guess_is_too_short
    mm = Mastermind.new
    mm.guess = ("s")

    assert_equal "Too short!", mm.guess_actions
  end

  def test_it_knows_if_it_is_too_long
    mm = Mastermind.new
    mm.guess = ("ssssss")

    assert_equal "Too long!", mm.guess_actions
  end

  def test_it_goes_to_end_game_if_guess_equals_answer
    mm = Mastermind.new
    mm.guess = "rgby"
    mm.answer = "rgby"

    assert_equal "Congratulations!", mm.guess_actions
  end

  def test_it_goes_to_feedback_if_guess_is_incorrect
    mm = Mastermind.new
    mm.guess = "grby"
    mm.answer = "rgyb"

    assert_equal ("feedback"), mm.guess_actions
  end


  def test_feedback_can_calculcate_the_number_of_correct_elements_
    mm = Mastermind.new
    mm.answer = "rgby"
    mm.guess = "bgby"
    mm.feedback

    assert_equal 3, mm.elements
  end

  def test_it_can_tell_how_many_are_in_correct_position
    mm = Mastermind.new
    mm.answer = "rbbg"
    mm.guess = "rrbg"
    mm.feedback

    assert_equal 3, mm.positions
  end

  def test_it_keeps_up_with_the_guess_count
    mm = Mastermind.new
    mm.guess = "rrrr"
    mm.guess_actions

    assert_equal 1, mm.guess_count

    mm.guess = "bbbb"
    mm.guess_actions
    mm.guess = "yyyy"
    mm.guess_actions

    assert_equal 3, mm.guess_count
  end
end

# def test_user_can_make_a_guess
#   mm = Mastermind.new
#   mm.("t")
#   assert_equal "t" , mm.guess
# end

# def test_guess_from_user_input_is_case_insensitive
#   mm = Mastermind.new
#   mm.guess = "Q"
#
#   assert_equal "q", mm.guess
# end

#
# def test_get_guess_method
#   mm = Mastermind.new
#
# end



# def test_feedback_prints_the_guess_upcased
#   mm = Mastermind.new
#   mm.get_guess("rbyg")
#
#   assert_equal "RBYG", mm.guess.upcase
# end
