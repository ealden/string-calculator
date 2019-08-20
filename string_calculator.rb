class StringCalculator
  DEFAULT_DELIMITER = ','

  def add numbers
    delimiter = DEFAULT_DELIMITER

    if numbers.start_with? '//'
      delimiter = numbers[2]
      number = numbers[3..]
    end

    sum = 0

    numbers = numbers.gsub '\n', delimiter

    values = numbers.split delimiter

    values.each do |value|
      sum += value.to_i
    end

    sum
  end
end
