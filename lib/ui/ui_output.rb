require 'colorize'
require 'artii'

# UIOutput responsible for printing CLI output to STDOUT
class UIOutput
  COMMAND_INFO_TEXT = "\nCalculator Commands:"\
    "\nr - show current result"\
    "\ns - show current operand stack"\
    "\nc - clear result and operand stack"\
    "\n\nOther Commands:"\
    "\nl - list commands"\
    "\nq - quit\n"\
    "\nExample expression:"\
    "\n15 7 1 1 + - / 3 * 2 1 1 + + -"\
    "\n\nSupported operators:"\
    "\n+ - / *\n".freeze

  WELCOME_MESSAGE_TEXT = 'Welcome to the RPN Calculator CLI!'\
    "\nYou may begin RPN calculations\n".freeze

  EXIT_MESSAGE_TEXT = "\nExiting RPN Calculator CLI...."\
    "\nGoodbye. Thank you.\n".freeze

  def self.print_about
    banner = Artii::Base.new(font: 'slant')
    banner = banner.asciify('RPN Calculator')
    puts banner.colorize(:yellow)

    puts 'RPN Calculator by Marcian Diamond'.colorize(:blue)
    puts 'https://www.marcian.guru'.colorize(:green)
  end

  def self.welcome_message_text
    WELCOME_MESSAGE_TEXT
  end

  def self.print_welcome_message
    print welcome_message_text
  end

  def self.command_info_text
    COMMAND_INFO_TEXT
  end

  def self.print_commands
    print command_info_text
  end

  def self.print_output(output)
    puts output.to_s
  end

  def self.print_exit_message
    print EXIT_MESSAGE_TEXT
  end
end
