
class Deck
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.size
  end

  def cards_in_category(category)
    return @cards.filter { |c| c.category == category}
  end
end
