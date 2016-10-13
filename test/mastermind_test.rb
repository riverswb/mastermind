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

  def test_it_has_an_answer
    mm = Mastermind.new
    mm.answer = "rgby"

    assert_equal 4, mm.answer.length
  end

  def test_if_guess_is_c_or_cheat_print_the_sequence
    mm = Mastermind.new
    mm.guess = ("c")
    mm.answer = "test"

    assert_equal "Cheater!", mm.guess_actions[0..7]
  end

  def test_knows_if_guess_is_too_short
    mm = Mastermind.new
    mm.guess = "s"
    mm.answer = "test"

    assert_equal "Too short!", mm.guess_actions
  end

  def test_it_knows_if_it_is_too_long
    mm = Mastermind.new
    mm.guess = "ssssss"
    mm.answer = "test"

    assert_equal "Too long!", mm.guess_actions
  end

  def test_it_goes_to_feedback_if_guess_is_incorrect

    mm = Mastermind.new
    mm.guess = "grby"
    mm.answer = "rgyb"

    assert_equal ("You've"), mm.guess_actions[0..5]
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
    mm.answer = "gggg"
    mm.guess = "rrrr"
    mm.guess_actions

    assert_equal 1, mm.guess_count

    mm.guess_actions
    mm.guess_actions

    assert_equal 3, mm.guess_count
  end
end
