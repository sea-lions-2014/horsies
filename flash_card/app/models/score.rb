class Score < ActiveRecord::Base
	belongs_to :user
  belongs_to :deck
  # Remember to create a migration!
end
