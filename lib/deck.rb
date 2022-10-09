class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(card_index)
    @cards[card_index].rank
  end

  def high_ranking_cards
    @cards.select {|card| card.rank >= 11}
  end

  def percent_high_ranking
    # @cards. {|card| card.rank >= 11}
  end

  def remove_card
    @cards.shift
  end

  def add_card(new_card)
    @cards << new_card
  end


end
