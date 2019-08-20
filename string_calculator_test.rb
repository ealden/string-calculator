require 'minitest/autorun'

require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
  def test_return_zero_if_numbers_is_empty
    assert_equal 0, add('')
  end

  def test_return_number_if_numbers_is_not_empty
    assert_equal 1, add('1')
  end

  def test_return_sum_if_numbers_has_one_comma
    assert_equal 3, add('1,2')
  end

  def test_return_sum_if_numbers_has_many_values
    assert_equal 15, add('1,2,3,4,5')
  end

  def test_return_sum_with_new_line_delimiter
    assert_equal 3, add('1\n2')
  end

  def test_return_sum_with_different_delimiter
    assert_equal 3, add('//;\n1;2')
  end

  def test_return_exception_if_numbers_has_one_negative_value
    assert_equal 'Negatives not allowed: [-1]', add('-1')
  end

  def test_return_exception_if_numbers_has_many_negative_values
    assert_equal 'Negatives not allowed: [-1, -2]', add('-1,-2')
  end

  def test_return_exception_if_numbers_has_a_negative_value_but_positive_total
    assert_equal 'Negatives not allowed: [-1]', add('-1,2')
  end

  def test_return_sum_but_ignore_values_greater_than_1000
    assert_equal 1000, add('1000,1001')
  end

  def test_return_sum_with_delimiter_of_any_length
    assert_equal 3, add('//[***]\n1***2')
  end

  def test_return_sum_with_multiple_delimiters_of_any_length
    assert_equal 6, add('//[***][%]\n1%2***3')
  end

  def test_return_sum_with_delimiter_of_any_length_and_multiple_new_lines
    assert_equal 3, add('//%\n1\n2')
  end

  private

  def add numbers
    calc = StringCalculator.new

    calc.add numbers
  end
end
