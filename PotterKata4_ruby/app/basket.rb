# Created 2014-05-29 08:11:55 +0200

class Basket
  def calculate_price(basket)
    books = (basket.group_by { |i| i }.map { |k,v| v.length }.to_a + [0]*6).sort.reverse
    piles = books.zip(books.drop(1)).take(5).map{ |x,y| x - y }.to_a
    fours = [piles[2], piles[4]].min
    8 * (
      piles[0] +
      piles[1] * 0.95 * 2 +
      (piles[2] - fours) * 0.9 * 3 +
      (piles[3] + 2 * fours) * 0.8 * 4 +
      (piles[4] - fours) * 0.75 * 5
    )
  end
end
