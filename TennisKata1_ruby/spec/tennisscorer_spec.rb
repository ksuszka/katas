require './app/tennisscorer.rb'

describe TennisScorer do
  context "get_score" do
    [
      ["", "love:love"],
      ["A", "15:love"],
      ["B", "love:15"],
      ["AB", "15:15"],
      ["AAB", "30:15"],
      ["AAAB", "40:15"],
      ["AAABBB", "deuce"],
      ["AAAA", "game A"],
      ["AAABBBA", "advantage A"],
      ["AAABBBB", "advantage B"],
      ["AAABBBAA", "game A"],
      ["AAABBBBB", "game B"],
      ["ABABABABABBB", "game B"],
    ].each do |moves, score|
      it "should return \"#{score}\" for moves \"#{moves}\"" do
        scorer = TennisScorer.new
        moves.each_char { |player| scorer.score_point(player) }
        result = scorer.get_score
        expect(result).to eq(score)
      end
    end
  end
end
