require "./app/roman_numerals.rb"

describe RomanNumerals do
  valid_cases = [
    ["I", 1],
    ["II", 2],
    ["V", 5],
    ["VI", 6],
    ["X", 10],
    ["XX", 20],
    ["L", 50],
    ["C", 100],
    ["D", 500],
    ["M", 1000],
    ["IV", 4],
    ["IX", 9],
    ["XL", 40],
    ["XC", 90],
    ["CD", 400],
    ["CM", 900],
    ["MCMXCVII", 1997]
  ]
  
  context "to_arabic" do
    valid_cases.each do |roman, arabic|
      it "should return #{arabic} for #{roman}" do
        result = RomanNumerals.to_arabic roman
        expect(result).to eq(arabic)
      end
    end
    
    [
      "VV",
      "WRONG",
      "MCMMVII"
    ].each do |roman|
      it "should raise exception for invalid input" do
        expect{ RomanNumerals.to_arabic roman }.to raise_exception "Invalid input!"
      end
    end
  end


  context "to_roman" do
    valid_cases.each do |roman, arabic|
      it "should return #{roman} for #{arabic}" do
        result = RomanNumerals.to_roman arabic
        expect(result).to eq(roman)
      end
    end
    
    it "should raise exception for input smaller than 1" do
      expect { RomanNumerals.to_roman 0 }.to raise_exception "Invalid input!"
    end
  end
  
end