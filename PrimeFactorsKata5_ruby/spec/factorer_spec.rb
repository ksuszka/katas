require "./app/factorer.rb"

describe Factorer do
  context "get_factors" do
    [
      [2],
      [3],
      [2, 2],
      [2, 2, 2],
      [3, 3],
      [2, 3, 3, 5, 7, 11, 97]
    ].map { |factors| [ factors.reduce(1, :*), factors] }.each do |number, factors|
      it "should return #{factors} for #{number}" do
        result = Factorer.get_factors number
        expect(result).to eq(factors)
      end
    end
    
    it "should throw exception for invalid input" do
      expect { Factorer.get_factors 1 }.to raise_error "Invalid input!"
    end
  end
end