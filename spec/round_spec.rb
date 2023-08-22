require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'RSpec'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)

RSpec.describe 'Round' do
  it 'should exist' do
    expect(round).to be_instance_of(Round)
  end

  it 'should contain deck' do
    expect(round.deck).to be_instance_of(Deck)
  end

  it 'should track turns' do
    expect(round.turns).to be_instance_of(Array)
  end

  it 'should show current_card' do
    expect(round.current_card).to be_instance_of(Card)
  end

  it 'should take_turn' do # return Turn object
    expect(round.take_turn('Juneau')).to be_instance_of(Turn)
  end

  it 'should track past turns' do
    # Check each element of the array
    round.turns.each do |turn|
      expect(turn).to be_instance_of(Turn)
    end

    expect(round.turns.count).to eq(1)
  end

  it 'should track number_correct' do
    expect(round.number_correct).to eq(1)
  end

  it 'should track number_correct_by_category' do
    round.take_turn("Venus")

    expect(round.turns.count).to eq(2)
    expect(round.number_correct_by_category(:Geography)).to eq(1)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
  end

  it 'should track percent_correct' do
    expect(round.percent_correct).to eq(50.0)
  end

  it 'should track percent_correct_by_category' do
    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
  end

end
