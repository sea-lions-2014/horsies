class Card < ActiveRecord::Base
  has_many :cardecks
	has_many :decks, through: :cardecks

  def add_to_deck!(deck)
    decks << deck
  end
end
