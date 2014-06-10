require "./app/tennisscorer.rb"

describe TennisScorer do
  context "scoring" do
    [
      ["", "love:love"],
      ["A", "15:love"],
      ["AA", "30:love"],
      ["AAA", "40:love"],
      ["ABB", "15:30"],
      ["AAABBB", "deuce"],
      ["AAAA", "player 1 wins"],
      ["BBBB", "player 2 wins"],
      ["ABABABAB", "deuce"],
      ["AAABBBA", "advantage for player 1"],
      ["AAABBBAA", "player 1 wins"]
    ].each do |scores_sequence, score| 
      it "should return score #{score}" do
        scorer = TennisScorer.new
        
        scores_sequence.each_char do |player_code|
          if (player_code == "A")
            scorer.scorePointFor(:player1)
          else
            scorer.scorePointFor(:player2)
          end  
        end
  
        expect(scorer.score).to eq(score)
      end
    end
  end
end
