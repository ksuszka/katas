module RomanNumeral
  ROMAN_SYMBOLS = {
    "I" => 1,
    "IV" => 4,
    "V" => 5,
    "IX" => 9,
    "X" => 10,
    "XL" => 40,
    "L" => 50,
    "XC" => 90,
    "C" => 100,
    "CD" => 400,
    "D" => 500,
    "CM" => 900,
    "M" => 1000
  }
  
  def self.to_arabic(roman)
    result = 0
    previous = 0
    roman.each_char do |d|
      current = ROMAN_SYMBOLS[d]
      result += current
      result -= 2 * previous if previous < current
      previous = current
    end
    result
  end
  
  def self.to_roman(arabic)
    result = ""
    ROMAN_SYMBOLS.sort_by { |r,a| -a }.each do |symbol, value|
      while arabic >= value
        result += symbol
        arabic -= value
      end
    end
    result
  end
end