# Created 2014-05-28 19:27:22 +0200

require "./app/basket.rb"

describe Basket do
  context "calculate_price" do
    subject { Basket.new }
    
    [
      [[], 0],
      [[0], 8],
      [[1], 8],
      [[2], 8],
      [[3], 8],
      [[4], 8],
      [[0, 0], 8 * 2],
      [[3, 3, 3], 8 * 3],
      [[0, 1], 8 * 2 * 0.95],
      [[0, 1, 2], 8 * 3 * 0.9],
      [[0, 1, 2, 3], 8 * 4 * 0.8],
      [[0, 1, 2, 3, 4], 8 * 5 * 0.75],
      [[0, 0, 1, 1], 2 * 8 * 2 * 0.95],
      [[0, 0, 0, 1, 1], 8 * (2 * 2 * 0.95 + 1)],
      [[0, 0, 1, 2, 2, 3], (8 * 4 * 0.8) + (8 * 2 * 0.95)],
      [[0, 1, 1, 2, 3, 4], 8 + (8 * 5 * 0.75)],
      [[0, 0, 1, 1, 2, 2, 3, 4], 2 * (8 * 4 * 0.8)],
      [[0, 0, 0, 0, 0, 
        1, 1, 1, 1, 1, 
        2, 2, 2, 2, 
        3, 3, 3, 3, 3, 
        4, 4, 4, 4], 3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8)]
    ].each do |basket, price|
      it "should return #{price} for basket #{basket}" do
        expect(subject.calculate_price(basket)).to eq(price)
      end
    end
  end
end
