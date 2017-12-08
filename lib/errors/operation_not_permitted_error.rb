require_relative './rpn_calculator_error'

# Error for operations that may not be carried out
# due to insufficient number of operands on the calculator stack
class OperationNotPermittedError < RPNCalculatorError
  def message
    'Operation not permitted.'\
    ' Not enough operands to perform specified operation.'
  end
end
