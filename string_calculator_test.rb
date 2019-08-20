require 'minitest/autorun'

require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
  def test_return_zero_if_numbers_is_empty
    assert_equal 0, add("")
  end

  private

  def add numbers
    calc = StringCalculator.new

    calc.add numbers
  end
end
