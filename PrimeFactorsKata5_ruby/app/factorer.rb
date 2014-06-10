module Factorer
  def self.get_factors(number)
    raise "Invalid input!" if number < 2
    result = []
    divider = 2
    while divider <= number
      while number % divider == 0
        result << divider
        number /= divider
      end
      divider += 1
    end
    result
  end
end