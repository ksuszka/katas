require "./app/tennisscorer.rb"

describe TennisScorer do
  context "scoring" do
    [
      ["", "love:love"],
      ["A", "15:love"],
      ["B", "love:15"],
      ["AB", "15:15"],
      ["AA", "30:love"],
      ["AAA", "40:love"],
      ["AABBB", "30:40"],
      ["AAABBB", "deuce"],
      ["AAABBBA", "advantage A"],
      ["AAABBBB", "advantage B"],
      ["AAABBBAA", "game A"],
      ["AAABBBBB", "game B"],
      ["AAAA", "game A"],
      ["BBBB", "game B"],
      ["AAAAB", "invalid game"],
      ["AAABBBBBB", "invalid game"],
      ["AAABBBBBA", "invalid game"],
    ].each do |moves, score|
      it "should return \"#{score}\" for moves \"#{moves}\"" do
        scorer = TennisScorer.new
        moves.each_char { |move| scorer.score_point(move) }
        expect(scorer.score).to eq(score)
      end
    end
  end
end
