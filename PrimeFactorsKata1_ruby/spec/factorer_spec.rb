require './app/factorer'

describe Factorer do
  before do
    @factorer = Factorer.new
  end
  
  context "get_factors" do
    it "should return empty list for 1" do
      factors = @factorer.get_factors 1
      expect(factors).to be_empty
    end

    cases = [
      [2],
      [2, 2],
      [2, 2, 2],
      [3, 3],
      [2, 2, 3, 7, 13, 97]
    ]
  
    cases.map { |x| [x.reduce(1, :*), x] }.each do |number, factors|
      it "should return list #{factors} for #{number}" do
        result = @factorer.get_factors number
        expect(result).to eq(factors)
      end
    end
  end
end
