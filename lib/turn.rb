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
      # return player with higher rank_of_card(0)
    elsif type == :war
      # return whichever player has a higher rank_of_card(2)
    else type == :mutually_assured_destruction
      "No Winner"
    end
  end

end
