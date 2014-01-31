class CreateCardecks < ActiveRecord::Migration
  def change
  	create_table :cardecks do |t|
  		t.integer :card_id, :deck_id
  	end
  end
end
