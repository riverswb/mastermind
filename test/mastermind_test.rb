require 'minitest/autorun'
require 'minitest/emoji'
require './lib/mastermind.rb'
require './lib/instructions.rb'
require "pry"
class MastermindTest < Minitest::Test

  def test_mastermind_exists
    assert Mastermind.new
  end

  def test_user_can_make_a_guess
    mm = Mastermind.new
    mm.get_guess("t")
    assert_equal "t" , mm.guess
  end

  def test_guess_is_case_insensitive

    mm = Mastermind.new
    mm.get_guess("QpRT")

    assert_equal "qprt" , mm.guess
  end

  def test_if_guess_is_q_or_quit_exit_game
    # skip
    mm = Mastermind.new
    mm.get_guess("q")

    assert_equal "Good Bye!", mm.quit_mastermind
  end

  def test_it_has_a_sequence
    mm = Mastermind.new

    assert_equal 4, mm.sequence.length
  end

  def test_if_guess_is_c_or_cheat_print_the_sequence
    mm = Mastermind.new
    mm.get_guess("c")

    assert_equal mm.sequence, mm.answer
  end

  def test_knows_if_guess_is_too_short
    mm = Mastermind.new

    assert_equal "Too short!", mm.get_guess("s")
  end

  def test_it_knows_if_it_is_too_long
    mm = Mastermind.new

    assert_equal "Too long!", mm.get_guess("ssssss")
  end

end
