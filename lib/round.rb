
class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards.shift
  end

  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    @turns << turn
    @current_card = deck.cards.shift
    return turn
  end

  def number_correct(category = nil)
    correct = 0
    turns = []
    category.nil? ? turns = @turns : turns = @turns.filter {
      |turn| turn.card.category == category }
    turns.each { |turn|  correct += 1 if turn.correct? }
    return correct
  end

  def number_correct_by_category(category)
    return number_correct(category)
  end

  def percent_correct(category = nil)
    denominator = category.nil? ? @turns.count : @turns.filter {
      |turn| turn.card.category == category }.count
    # need to convert to float
    number_correct(category).to_f / denominator * 100.0
  end

  def percent_correct_by_category(category)
    percent_correct(category)
  end

end
