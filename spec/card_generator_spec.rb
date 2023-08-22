require './lib/card_generator'
require './lib/card'

RSpec.describe 'CardGenerator' do
  it 'should exist' do
    cgen = CardGen.new("cards.txt")

    expect(cgen).to be_instance_of(CardGen)
    expect(cgen.cards).to be_instance_of(Array)
  end
end
