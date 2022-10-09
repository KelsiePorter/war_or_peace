require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require 'pry'

RSpec.describe Player do

  it "player has a name" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(player.name).to eq("Clarisa")
  end

  it "player has a deck of cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(player.deck.cards).to eq([card1, card2, card3])
  end

  it "player has not lost by default" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(player.has_lost?).to be false
  end

  it "player removes a card from deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(player.has_lost?).to be false
    expect(player.deck.remove_card).to eq(card1)
    expect(player.deck.cards.length).to eq(2)
    expect(player.has_lost?).to be false
    expect(player.deck.remove_card).to eq(card2)
    expect(player.deck.cards.length).to eq(1)
    expect(player.deck.remove_card).to eq(card3)
    expect(player.deck.cards.length).to eq(0)
    expect(player.has_lost?).to be true
    expect(player.deck).to eq(deck)
  end

end
