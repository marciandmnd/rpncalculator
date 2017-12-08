require 'minitest/autorun'
require_relative "#{LIB_PATH}/ui/ui_output"

class TestUIOutput < Minitest::Test
  def test_print_about
    output = capture_io do
      UIOutput.print_about
    end

    assert_match(/RPN Calculator by Marcian Diamond/, output[0])
    assert_match(%r{https://www.marcian.guru}, output[0])
  end

  def test_print_welcome_message
    output = capture_io do
      UIOutput.print_welcome_message
    end

    assert_match(UIOutput.welcome_message_text, output[0])
  end

  def test_print_output
    test_string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit\n"
    output = capture_io do
      UIOutput.print_output(test_string)
    end

    assert_equal(test_string, output[0])
  end

  def test_print_commands
    output = capture_io do
      UIOutput.print_commands
    end

    assert_match(UIOutput.command_info_text, output[0])
  end
end
