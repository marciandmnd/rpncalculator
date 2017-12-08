require_relative './command_evaluator'
require_relative './ui_output'
require_relative '../errors/rpn_calculator_error'

# CLI interface for performing RPN Calculations
class RPNCalculatorCLI
  def self.start
    UIOutput.print_welcome_message
    UIOutput.print_commands
    run_event_loop
  end

  def self.run_event_loop
    loop do
      begin
        read_user_command
      rescue RPNCalculatorError => e
        puts e.message
      rescue SystemExit, SignalException, Exception
        exit_cli
      end
    end
  end

  def self.read_user_command
    print '> '
    command = gets.chomp
    unless command.empty?
      result = CommandEvaluator.evaluate_command(command)
      UIOutput.print_output(result)
    end
  end

  def self.exit_cli
    UIOutput.print_exit_message
    exit
  end
end
