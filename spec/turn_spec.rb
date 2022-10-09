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
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
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

    expect(@turn.type).to eq(:basic)
    expect(@turn.player1.deck.rank_of_card_at(0)).to eq(11)
    expect(@turn.player2.deck.rank_of_card_at(2)).to eq(12)
  end

  it "each turn may have a winner" do

    expect(@turn.type).to eq(:basic)
    expect(@turn.winner).to eq(@player1)
  end

  it "the pile of cards is growing" do

    @turn.pile_cards
    expect(@turn.spoils_of_war).to eq([@card1, @card3])
  end

  xit "the winner's deck is growing" do

    @turn.pile_cards
    @turn.spoils_of_war
    expect(@player1.deck).to eq([@card1, @card2, @card5, @card8, @card3])
  end


end
