class Deck < ActiveRecord::Base
	has_many :cards through :cardeck
	belongs_to :user
  # Remember to create a migration!
end
