# Created 2014-05-28 19:27:22 +0200

class Basket
  def calculate_price(basket)
    def best_price(books)
      discounts = [1, 1, 0.95, 0.9, 0.8, 0.75]
      books = books.select { |b| b > 0 }
      return 0 if books.empty?
      return books.first * 8 if books.length == 1
      
      (1..books.length).map do |i|
        (0..books.length - 1).to_a.permutation(i).map do |p|
          new_books = books.clone
          p.each { |x| new_books[x] -= 1 }
          discounts[i] * i * 8 + best_price(new_books)
        end
      end.flatten.min
    end
    
    books = basket.group_by { |i| i }.map { |k,v| v.length }.to_a
    best_price(books)
  end
end
