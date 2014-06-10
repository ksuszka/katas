module RomanNumeral
  ROMAN_VALUES = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }
  
  EXTENDED_ROMAN_VALUES = {
    "IV" => 4,
    "IX" => 9,
    "XL" => 40,
    "XC" => 90,
    "CD" => 400,
    "CM" => 900
  }.merge(ROMAN_VALUES)
  
  def self.to_arabic(roman)
    result = 0
    previous = 0
    roman.each_char do |x|
      value = ROMAN_VALUES[x]
      raise "Invalid input!" if value === nil
      result += value
      result -= previous * 2 if previous < value
      previous = value
    end
    result
  end
  
  def self.to_roman(arabic)
    result = ""
    EXTENDED_ROMAN_VALUES.sort_by {|k,v| -v}.each do |letter, value|
      while arabic >= value
        arabic -= value
        result += letter
      end
    end
    result
  end
end