require "./app/roman_numeral"

describe RomanNumeral do
  context "to_arabic" do
    it "should throw exception on wrong input" do
      expect{ RomanNumeral.to_arabic("WRONG") }.to raise_error
    end
    
    minimal_numbers_cases = {
      "I" => 1,
      "II" => 2,
      "III" => 3,
      "V" => 5,
      "VIII" => 8,
      "IX" => 9,
      "X" => 10,
      "XL" => 40,
      "L" => 50,
      "C" => 100,
      "D" => 500,
      "M" => 1000,
      "MCMXCVII" => 1997
    }
    
    extended_numbers_cases = {
      "IIIIIIIIIIIIIIII" => 16,
      "VIIIIIIIIIII" => 16,
      "VVIIIIII" => 16,
      "XIIIIII" => 16,
      "VVVI" => 16,
      "XVI" => 16
    }.merge(minimal_numbers_cases)
    
    extended_numbers_cases.each do |roman, arabic|
      it "should convert #{roman} to #{arabic}" do
        expect(RomanNumeral.to_arabic(roman)).to eq(arabic)
      end
    end
    
    minimal_numbers_cases.each do |roman, arabic|
      it "should convert #{arabic} to #{roman}" do
        expect(RomanNumeral.to_roman(arabic)).to eq(roman)
      end
    end
  end
end