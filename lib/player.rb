class Player
  attr_reader :name,
              :deck
  attr_accessor :has_lost

  def initialize(name, deck)
    @name = name
    @deck = deck
    @has_lost = false
  end

  def has_lost?
    @has_lost
  end

  def remove_card
    @deck.cards.shift
    if @deck.cards.length >= 2
      @has_lost = false
    else @deck.cards.length < 2
      has_lost = true
    end
  end

end
