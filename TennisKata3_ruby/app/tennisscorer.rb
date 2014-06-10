class TennisScorer
  
  def initialize
    @points = Hash.new(0)
  end
  
  @@names = ["love", "15", "30", "40"]
  def score
    a = @points[:player1]
    b = @points[:player2]
    if a > b
      winning = ["player 1", a]
      loosingPoints = b
    else
      winning = ["player 2", b]
      loosingPoints = a
    end  
    
    if (a == b and a >= 3)
      "deuce"
    elsif (winning[1] == loosingPoints+1 and a >= 4)
      "advantage for #{winning[0]}"
    elsif (winning[1] > loosingPoints + 1 and winning[1] >= 4)
      "#{winning[0]} wins"
    else
      @@names[a] + ":" + @@names[b]
    end
  end
  
  def scorePointFor(player)
    @points[player] += 1
  end
  
end
