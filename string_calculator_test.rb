require 'minitest/autorun'

require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
  def test_return_zero_if_numbers_is_empty
    assert_equal 0, add("")
  end

  def test_return_number_if_numbers_is_not_empty
    assert_equal 1, add("1")
  end

  def test_return_sum_if_numbers_has_one_comma
    assert_equal 3, add("1,2")
  end

  def test_return_sum_if_numbers_has_many_values
    assert_equal 15, add("1,2,3,4,5")
  end

  private

  def add numbers
    calc = StringCalculator.new

    calc.add numbers
  end
end
