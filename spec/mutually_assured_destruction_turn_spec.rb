require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require 'pry'

RSpec.describe Turn do
  before(:each) do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, '8', 8)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  it "create a deck of cards for each player" do

    expect(@turn.player1).to eq(@player1)
    expect(@turn.player2).to eq(@player2)
    expect(@turn.spoils_of_war).to eq([])
  end

  it "each turn has a type" do

    expect(@turn.type).to eq(:mutually_assured_destruction)
    expect(@turn.player1.deck.rank_of_card_at(0)).to eq(11)
    expect(@turn.player2.deck.rank_of_card_at(2)).to eq(8)
  end

  it "each turn may have a winner" do

    expect(@turn.type).to eq(:mutually_assured_destruction)
    expect(@turn.winner).to eq("No Winner")
  end

  it "the pile of cards is growing" do

    @turn.pile_cards
    expect(@turn.spoils_of_war).to eq([])
  end

  it "no award spoils this turn" do

    @turn.pile_cards
    expect(@player1.deck).to eq(@deck1)
    expect(@player2.deck).to eq(@deck2)
    expect(@player1.deck.cards).to eq([@card8])
    expect(@player2.deck.cards).to eq([@card7])
    expect(@player1.has_lost?).to be false
    expect(@player2.has_lost?).to be false
  end


end
