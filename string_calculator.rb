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

    sum = values.map(&:to_i).inject 0, :+

    if sum < 0
      return 'Negatives not allowed'
    else
      sum
    end
  end
end
