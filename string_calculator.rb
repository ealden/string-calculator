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

    values.map(&:to_i).inject 0, :+
  end
end
