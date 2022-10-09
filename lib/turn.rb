class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2, spoils_of_war = [])
    @player1 = player1
    @player2 = player2
    @spoils_of_war = spoils_of_war
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else @player1.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    end
  end

  def winner
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      else
        @player2
      end
    else type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_of_cards
    if type == :basic
      @spoils_of_war << @player1.deck.cards([0] && @player2.deck.cards[0]
    elsif type == :war
      @spoils_of_war << @player1.deck.cards[0..2] && @player2.deck.cards[0..2]
    else type == :mutually_assured_destruction
      @player1.deck.cards[0..2].delete && @player2.deck.cards[0..2].delete
    end
  end

  # def award_spoils(winner)
  #   << @spoils_of_war
  # end

end
