class Factorer
  def get_factors(number)
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
