require_relative '../errors/operation_not_permitted_error'
require_relative '../errors/invalid_expression_error'

# Perform RPNCalculations
class RPNCalculator
  attr_reader :stack

  def initialize
    @stack = []
  end

  def result
    @stack.empty? ? 0 : @stack[0]
  end

  def clear_stack
    @stack = []
  end

  def expression_valid?(expression)
    !(%r{[^\d+\-*\/\s]} =~ expression)
  end

  def evaluate_expression(expression)
    fail InvalidExpressionError unless expression_valid?(expression)
    current_stack = @stack.dup
    tokens = expression.scan(%r{\d+|[+]|[-]|[\/]|[*]})
    tokens.each do |t|
      case t
      when /\d/
        @stack.push(t.to_f)
      when '-', '/', '*', '+'
        if @stack.size >= 2
          operands = @stack.pop(2)
          result = operands[0].send(t, operands[1])
          @stack.push(result)
        else
          @stack = current_stack
          fail OperationNotPermittedError
        end
      end
    end
    @stack[-1]
  end
end
