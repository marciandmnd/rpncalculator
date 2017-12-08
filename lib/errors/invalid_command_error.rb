require_relative './rpn_calculator_error'

# Error for invalid commands entered by user
class InvalidCommandError < RPNCalculatorError
  def message
    'Invalid command.'
  end
end
