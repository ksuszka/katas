class TennisScorer

  attr_reader :score
  
  def initialize()
    @points = Hash.new(0)
    @score = calculate_score
  end
  
  def score_point(player)
    if is_finished
      @score = "invalid game"
    else
      @points[player] += 1
      @score = calculate_score
    end
  end
  
  private
  
  @@names = ["love", "15", "30", "40"]
  def get_name_for_score(score)
    @@names[score]
  end
  
  def calculate_score
    a = @points["A"]
    b = @points["B"]
    if (a >= 3 and b >= 3) or (a >= 4 or b >= 4)
      case a-b
      when -4..-2 then "game B"
      when -1 then "advantage B"
      when 0 then "deuce"
      when 1 then "advantage A"
      when 2..4 then "game A"
      else
        "invalid game"
      end
    else
      get_name_for_score(a) + ":" + get_name_for_score(b)
    end
  end

  def is_finished
    @score =~ /game/ or @score =~ /invalid/
  end
end
