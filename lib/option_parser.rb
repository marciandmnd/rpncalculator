require_relative './ui/rpn_calculator_cli'
require_relative './ui/ui_output'

require 'optparse'
require 'ostruct'
require 'semver'

# Parse command line argument vector
class OptionParser
  def self.parse(args)
    ARGV << '-h' if ARGV.empty?

    options = OpenStruct.new
    options.empty_argv = false
    options.expression = nil
    options.about = false
    options.start = false

    opt_parser = OptionParser.new do |opts|
      opts.banner = 'Usage: rpncalculator [options]'

      opts.separator ''
      opts.separator 'Specific options:'

      opts.on('-e', "--expression='1 2 3 + -'",
              'Evaluate RPN expression') do |expression|
        options.expression = expression
      end

      opts.on('-a', '--about', 'About rpncalculator') do
        options.about = true
      end

      opts.on('-s', '--start', 'Start rpncalculator CLI') do
        options.start = true
      end

      opts.separator ''
      opts.separator 'Common options:'

      opts.on_tail('-h', '--help', 'Show this message') do
        puts opts
        exit
      end

      opts.on_tail('-v', '--version', 'Show version') do
        puts SemVer.find.to_s
        exit
      end
    end

    opt_parser.parse!(args)
    options
  end

  def self.execute
    options = OptionParser.parse(ARGV)
    UIOutput.print_about if options.about
    if options.expression
      puts RPNCalculator.new.evaluate_expression(options.expression)
    end
    RPNCalculatorCLI.start if options.start
  rescue => e
    puts e.message
  end
end
