require_relative "#{LIB_PATH}/rpn_calculator/rpn_calculator"
require 'minitest/autorun'

class TestRPNCalculator < Minitest::Test
  def setup
    @rpn_calculator = RPNCalculator.new
  end

  def test_stack
    # initial stack
    stack = @rpn_calculator.stack
    assert_equal([], stack)

    # stack with operands
    expected = [1.0, 2.0, 3.0]
    @rpn_calculator.evaluate_expression('1 2 3')
    stack = @rpn_calculator.stack
    assert_equal(expected, stack)
  end

  def test_result
    # initial result
    result = @rpn_calculator.result
    assert_equal(0, result)

    # computed result
    @rpn_calculator.evaluate_expression('1 2 3 + -')
    result = @rpn_calculator.result
    assert_equal(-4, result)
  end

  def test_evaluate_expression
    # valid expression
    expression = '15 7 1 1 + - / 3 * 2 1 1 + + -'
    result = @rpn_calculator.evaluate_expression(expression)
    assert_equal(5, result)

    @rpn_calculator.clear_stack

    # invalid expression
    expression = '15 7 1 1 d + - / 3 * 2 1 1 + + - x'
    assert_raises InvalidExpressionError do
      @rpn_calculator.evaluate_expression(expression)
    end

    # operation not permitted
    @rpn_calculator.clear_stack

    assert_raises OperationNotPermittedError do
      @rpn_calculator.evaluate_expression('1 + +')
    end
  end
end
