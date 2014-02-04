class Card < ActiveRecord::Base
  has_many :cardecks
	has_many :decks, through: :cardecks

  def add_to_deck!(deck)
    decks << deck
  end

  def correct_guess?(guess)
     guess.downcase == self.answer.downcase
  end
end
