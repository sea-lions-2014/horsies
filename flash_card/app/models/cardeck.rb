class Cardeck < ActiveRecord::Base
	belongs_to :card
	belongs_to :deck
  # Remember to create a migration!
end
