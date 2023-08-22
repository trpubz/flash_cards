require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

cards = CardGen.new("cards.txt").cards
deck = Deck.new(cards)
deck_size = deck.count
round = Round.new(deck)

puts "Welcome! You\'re playing with #{deck_size} cards."
puts '-------------------------------------------------'

deck_size.times do |i|
  puts "This is card number #{i + 1} out of #{deck_size}"
  puts "Question: #{round.current_card.question}"
  # puts "Expected answer: #{round.current_card.answer}"
  response = gets.chomp  # required to trim new line character from response
  puts "Response: #{response}"
  turn = round.take_turn(response)
  puts "#{turn.feedback}"
end

puts "\n****** Game over! ******\n"

round.round_summary
