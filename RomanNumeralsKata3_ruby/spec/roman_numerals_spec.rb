require "./app/roman_numerals.rb"

describe RomanNumerals do
  test_cases = [
    [1, "I"],
    [2, "II"],
    [5, "V"],
    [6, "VI"],
    [10, "X"],
    [20, "XX"],
    [50, "L"],
    [100, "C"],
    [500, "D"],
    [1000, "M"],
    [4, "IV"],
    [9, "IX"],
    [40, "XL"],
    [90, "XC"],
    [400, "CD"],
    [900, "CM"],
    [2014, "MMXIV"]
  ]
  
  context "to_roman" do
    test_cases.each do |arabic, roman|
      it "should convert #{arabic} to #{roman}" do
        result = RomanNumerals.to_roman arabic
        expect(result).to eq(roman)
      end
    end
    
    [ 0, -1 ].each do |arabic|
      it "should raise exception on #{arabic}" do
        expect{ RomanNumerals.to_roman arabic }.to raise_error
      end
    end
  end
  
  context "to_arabic" do
    test_cases.each do |arabic, roman|
      it "should convert #{roman} to #{arabic}" do
        result = RomanNumerals.to_arabic roman
        expect(result).to eq(arabic)
      end
    end
    
    it "should raise exception on wrong input" do
      expect { RomanNumerals.to_arabic "WRONG" }.to raise_error "Invalid input!"
    end
  end
end