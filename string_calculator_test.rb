require 'minitest/autorun'

require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
  def test_return_zero_if_numbers_is_empty
    assert_equal 0, add("")
  end

  def test_return_number_if_numbers_is_not_empty
    assert_equal 1, add("1")
  end

  private

  def add numbers
    calc = StringCalculator.new

    calc.add numbers
  end
end
