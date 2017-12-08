require_relative './rpn_calculator_error'

# Error for invalid RPN expressions (i.e. 1 gh + s)
class InvalidExpressionError < RPNCalculatorError
  def message
    'Invalid expression.'
  end
end
