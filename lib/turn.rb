
class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess.downcase
    @card = card
  end

  def correct?
    return @guess == @card.answer
  end

  def feedback
    correct? ? "Correct!" : "Incorrect."
  end
end
