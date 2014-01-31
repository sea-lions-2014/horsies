class CreateScores < ActiveRecord::Migration
  def change
  	create_table :scores do |t|
  		t.integer :user_id
  		t.string :value
  		t.integer :deck_id
  	end
  end
end
