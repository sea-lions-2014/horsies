require 'csv'
deck = Deck.where(name: 'Andy').first

unless deck
  deck = Deck.create(name: 'Andy')

  CSV.foreach(File.open(File.expand_path('cards.csv','../flash_card/db') )) do |row|
    deck.cards << Card.create(question: row[0], answer: row[1])
  end
end