class Card < ActiveRecord::Base
	has_many :decks, through: :cardecks
  # Remember to create a migration!
end
