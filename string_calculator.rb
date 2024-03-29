class StringCalculator
  DEFAULT_DELIMITER = ','
  CUSTOM_DELIMITER = '//'
  NEW_LINE = '\n'

  MAX_VALUE = 1000

  def add numbers
    delimiters = [NEW_LINE]

    if numbers.start_with? CUSTOM_DELIMITER
      numbers.delete_prefix! CUSTOM_DELIMITER

      delimiter, numbers = numbers.split NEW_LINE, 2

      delimiters += delimiter.split('][').collect { |delimiter| delimiter.delete '[]' }
    end

    delimiters.each do |delimiter|
      numbers.gsub! delimiter, DEFAULT_DELIMITER
    end

    values = numbers.split(DEFAULT_DELIMITER).map &:to_i

    negatives = values.select { |value| value.negative? }

    return "Negatives not allowed: #{negatives}" unless negatives.empty?

    values.reject! { |value| value > MAX_VALUE }

    values.sum
  end
end
