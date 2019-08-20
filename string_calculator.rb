class StringCalculator
  DEFAULT_DELIMITER = ','
  CUSTOM_DELIMITER = '//'
  NEW_LINE = '\n'

  def add numbers
    delimiter = DEFAULT_DELIMITER

    if numbers.start_with? CUSTOM_DELIMITER
      numbers = numbers[2..]

      delimiter, numbers = numbers.split NEW_LINE, 2
    end

    numbers = numbers.gsub NEW_LINE, delimiter

    values = numbers.split delimiter
    values = values.map &:to_i

    negatives = values.select { |value| value < 0 }

    unless negatives.empty?
      return "Negatives not allowed: #{negatives}"
    end

    values = values.reject { |value| value > 1000 }

    values.inject 0, :+
  end
end
