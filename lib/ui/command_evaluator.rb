require_relative '../rpn_calculator/rpn_calculator'
require_relative '../errors/invalid_command_error'
require_relative '../ui/ui_output'

# Evaluate user commands received via RPNCalculatorCLI
class CommandEvaluator
  @rpn_calculator = RPNCalculator.new
  VALID_COMMAND_REGEX = %r{^(l|q|r|s|c){1}$|(\d+|[+\-*\/])}

  def self.evaluate_command(command)
    command.strip!
    fail InvalidCommandError unless command_valid?(command)

    result =
      case command
      when 'r'
        dispatch_command(:result)
      when 's'
        dispatch_command(:stack)
      when 'c'
        dispatch_command(:clear_stack)
      when 'l'
        UIOutput.send(:print_commands)
      when 'q'
        exit_cli_interface
      else
        dispatch_command(:evaluate_expression, command)
      end
    result
  end

  def self.dispatch_command(command, args = nil)
    if !args.nil?
      @rpn_calculator.send(command, args)
    else
      @rpn_calculator.send(command)
    end
  end

  def self.command_valid?(command)
    VALID_COMMAND_REGEX.match(command)
  end

  def self.exit_cli_interface
    UIOutput.print_exit_message
    exit
  end
end
