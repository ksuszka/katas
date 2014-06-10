class TennisScorer
  def initialize()
    @points = Hash.new(0)
  end
  
  def score_point(player)
    @points[player] += 1
  end
  
  @@name = ["love", "15", "30", "40"]
  def get_score
    a = @points["A"]
    b = @points["B"]
    if [a, b].min >= 3 or [a, b].max >= 4
      case a-b
      when -4..-2 then "game B"
      when -1 then "advantage B"
      when 0 then "deuce"
      when 1 then "advantage A"
      when 2..4 then "game A"
      else
        "invalid"
      end
    else
      scoreA = @@name[a]
      scoreB = @@name[b]
      "#{scoreA}:#{scoreB}"
    end
  end
end