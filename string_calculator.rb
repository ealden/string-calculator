class StringCalculator
  def add numbers
    if numbers.empty?
      return 0
    end

    sum = 0

    values = numbers.split ','

    values.each do |value|
      sum += value.to_i
    end

    return sum
  end
end
