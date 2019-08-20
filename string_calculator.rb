class StringCalculator
  DEFAULT_DELIMITER = ','

  def add numbers
    delimiter = DEFAULT_DELIMITER

    if numbers.start_with? '//'
      delimiter = numbers[2]
      number = numbers[3..]
    end

    numbers = numbers.gsub '\n', delimiter

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
