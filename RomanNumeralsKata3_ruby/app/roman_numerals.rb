module RomanNumerals
  ROMAN_SYMBOLS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }
  def self.to_roman(arabic)
    raise "Nonconvertible input!" if arabic <= 0
    result = ""
    ROMAN_SYMBOLS.each do |symbol, value|
      while arabic >= value
        result << symbol
        arabic -= value
      end
    end
    result
  end
  
  def self.to_arabic(roman)
    result = 0
    previous = 0
    roman.each_char do |c|
      value = ROMAN_SYMBOLS[c]
      raise "Invalid input!" if value == nil
      result += value
      result -= 2 * previous if value > previous
      previous = value
    end
    result
  end
end