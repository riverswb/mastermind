require 'minitest/autorun'
require 'minitest/emoji'
require './lib/mastermind.rb'
require './lib/instructions.rb'

class MastermindTest < Minitest::Test

  def test_mastermind_exists
    assert Mastermind.new
  end

  def test_user_can_make_a_guess
    skip
    mm = Mastermind.new

    assert_equal "q" , mm.get_guess
  end

  def test_guess_is_case_insensitive
    skip
    mm = Mastermind.new

    assert_equal "q" , mm.get_guess
  end

  def test_if_guess_is_q_or_quit_exit_game
    skip
    mm = Mastermind.new
    mm.get_guess

    assert_equal "Good Bye!", mm.quit_mastermind
  end

  def test_it_has_a_sequence

  end

  def test_if_guess_is_c_or_cheat_print_the_sequence
    skip
    mm = Mastermind.new
    mm.get_guess

    assert mm.get_cheat
  end

end
