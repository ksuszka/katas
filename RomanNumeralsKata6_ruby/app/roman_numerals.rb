module RomanNumerals
  CONVERSION_TABLE = [
    ["M", 1000, true],
    ["CM", 900, false],
    ["D", 500, false],
    ["CD", 400, false],
    ["C", 100, true],
    ["XC", 90, false],
    ["L", 50, false],
    ["XL", 40, false],
    ["X", 10, true],
    ["IX", 9, false],
    ["V", 5, false],
    ["IV", 4, false],
    ["I", 1, true]
  ]
  
  def self.to_arabic(roman)
    result = 0
    CONVERSION_TABLE.each do |symbol, value, can_be_repeated|
      while roman.start_with?(symbol)
        result += value
        roman = roman.slice(symbol.length..roman.length)
        break if not can_be_repeated
      end
    end
    raise "Invalid input!" if not roman.empty?
    result
  end
  
  def self.to_roman(arabic)
    raise "Invalid input!" if arabic < 1
    result = ""
    CONVERSION_TABLE.each do |symbol, value, _|
      while arabic >= value
        result << symbol
        arabic -= value
      end
    end
    result
  end
end