class StringCalculator
  DELIMITER = ','

  def add numbers
    sum = 0

    values = numbers.split DELIMITER

    values.each do |value|
      sum += value.to_i
    end

    sum
  end
end
