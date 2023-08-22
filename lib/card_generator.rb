require './lib/card'

class CardGen
  attr_accessor :cards

  def initialize(file_path)
    @cards = []
    parse(file_path)
  end

  private

  def parse(file_path)
    File.foreach(file_path) do |line|
      question, answer, category = line.chomp.split(',')
      @cards << Card.new(question, answer, category)
    end
  end
end
