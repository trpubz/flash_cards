require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

card1 = Card.new('What is 5 + 5?', '10', :STEM)
card2 = Card.new('What is Rachel\'s favorite animal?', 'panda', "Pop Culture")
card3 = Card.new('What is Mike\'s middle name?', 'nobody knows', "Turning Staff")
card4 = Card.new('What cardboard cutout lives at Turing?', 'Justin Bieber', "Pop Culture")
cards = [card1, card2, card3, card4]
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

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{deck_size} for a total score of #{round.percent_correct}%"

uniq_turns = round.turns.uniq { |turn| turn.card.category }
uniq_categories = []
uniq_turns.each { |turn| uniq_categories << turn.card.category }

uniq_categories.each do |cat|
  puts "#{cat} - #{round.percent_correct_by_category(cat)}% correct"
end
