class Deck < ActiveRecord::Base
  has_many :cardecks
	has_many :cards, through: :cardecks
	belongs_to :user
  # Remember to create a migration!
end
