class Card < ActiveRecord::Base
  has_many :cardecks
	has_many :decks, through: :cardecks
  # Remember to create a migration!
end
