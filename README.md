#  Flash Cards

[Flash Cards](http://backend.turing.io/module1/projects/flashcards) project.

A program to simulate a set of flash cards. A user will be able to see the questions, make guesses, and see a final score at the end of the round.

#### Tools
- ruby
- rspec

#### Programming Concepts
- File IO
  -  [card_generator.rb:14](./lib/card_generator.rb)
  -  ```ruby
     File.foreach(file_path) do |line|
       question, answer, category = line.chomp.split(',')
     end
     ```
- `gets.chomp` for `STDIN`
 
