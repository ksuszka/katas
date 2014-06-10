require './app/roman_numeral.rb'

describe RomanNumeral do
  cases = {
    "I" => 1,
    "II" => 2,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000,
    "XI" => 11,
    "IV" => 4,
    "MCMXCVIII" => 1998,
    "MMXIV" => 2014
  }
  
  context "to_arabic" do
    cases.each do |roman, arabic|
      it "should convert #{roman} to #{arabic}" do
        result = RomanNumeral.to_arabic(roman)
        expect(result).to eq(arabic)
      end
    end
  end
  
  context "to_roman" do
    cases.each do |roman, arabic|
      it "should convert #{arabic} to #{roman}" do
        result = RomanNumeral.to_roman(arabic)
        expect(result).to eq(roman)
      end
    end
  end
end