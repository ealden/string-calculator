class StringCalculator
  DEFAULT_DELIMITER = ','
  CUSTOM_DELIMITER = '//'
  NEW_LINE = '\n'

  def add numbers
    delimiters = [NEW_LINE]

    if numbers.start_with? CUSTOM_DELIMITER
      numbers = numbers[2..]

      delimiter, numbers = numbers.split NEW_LINE

      delimiters = delimiters + delimiter.split('][')
    end

    delimiters.each do |delimiter|
      delimiter = delimiter.gsub('[', '').gsub(']', '')

      numbers = numbers.gsub delimiter, DEFAULT_DELIMITER
    end

    values = numbers.split DEFAULT_DELIMITER

    values = values.map &:to_i

    negatives = values.select { |value| value < 0 }

    unless negatives.empty?
      return "Negatives not allowed: #{negatives}"
    end

    values = values.reject { |value| value > 1000 }

    values.inject 0, :+
  end
end
