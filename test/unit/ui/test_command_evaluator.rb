require 'minitest/autorun'
require_relative "#{LIB_PATH}/ui/command_evaluator"
require_relative "#{LIB_PATH}/ui/ui_output"

class TestCommandEvaluator < Minitest::Test
  def test_evaluate_command
    # expression command
    expression = '15 7 1 1 + - / 3 * 2 1 1 + + -'
    result = CommandEvaluator.evaluate_command(expression)
    assert_equal(5.0, result)

    # r - result command
    result = CommandEvaluator.evaluate_command('r')
    assert_equal(5.0, result)

    # c - clear stack command
    result = CommandEvaluator.evaluate_command('c')
    assert_equal([], result)
  end
end
