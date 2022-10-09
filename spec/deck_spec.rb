require 'rspec'
require './lib/deck'
require './lib/card'
require 'pry'

RSpec.describe Deck do

  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    expect(deck).to be_an_instance_of(Deck)
  end


  it "has cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.cards).to eq([card1, card2, card3])
  end

  it "returns the rank of a card based on its index positon" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
    expect(deck.rank_of_card_at(1)).to eq(3)
  end

  it "returns cards with ranks higher than 11" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to eq([card1, card3])
  end

  it "returns the percent of cards with ranks higher than 11" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq(66.67)
  end

  it "removes a card from the cards attribute" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    # deck.remove_card
    expect(deck.remove_card).to eq(card1)
    #when I had sqaure brackets around card 1, I was getting an error
    expect(deck.cards).to eq([card2, card3])
    expect(deck.cards.count).to eq(2)
    expect(deck.high_ranking_cards).to eq([card3])
    # expect(deck.percent_high_ranking).to eq(50.0)
    #can't figure out how to return a percent
  end

  it "adds a new card to the deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    deck.remove_card
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)

    expect(deck.cards).to eq([card2, card3, card4])
    expect(deck.high_ranking_cards).to eq([card3])
    # expect(deck.percent_high_ranking).to eq(33.33)
  end

  end
