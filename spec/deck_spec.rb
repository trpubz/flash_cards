require './lib/card'
require './lib/deck'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new([card_1, card_2, card_3])

    expect(deck).to be_instance_of(Deck)
  end

  it 'contains cards' do
    deck = Deck.new([card_1, card_2, card_3])

    expect(deck.count).to eq 3
  end

  it 'can filter categories' do
    deck = Deck.new([card_1, card_2, card_3])

    expect(deck.cards_in_category(:STEM).count).to eq 2
    expect(deck.cards_in_category(:Geography).count).to eq 1
    expect(deck.cards_in_category("Pop Culture").count).to eq 0
  end
end
