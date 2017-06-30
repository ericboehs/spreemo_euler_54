require_relative 'lib/poker'

class PokerResults
  attr_accessor :hands_won

  def initialize
    @hands_won = Hash.new 0
  end

  def calculate
    lines.each do |line|
      player_1_hand = parse_hand line[0..13]
      player_2_hand = parse_hand line[15..28]

      best_hand = Poker::Hand.best [player_1_hand, player_2_hand]

      if best_hand == player_1_hand
        hands_won[:player_1] += 1
      else
        hands_won[:player_2] += 1
      end
    end
  end

  private

  def parse_hand string
    Poker::Hand.new string.split.map { |card| Poker::Card.new card[0], card[1] }
  end

  def lines
    File.readlines 'poker.txt'
  end
end

results = PokerResults.new
results.calculate
puts results.hands_won
