class CreateCards < ActiveRecord::Migration
  def change
  	create_table :CreateCards do |t|
  		t.string :question, :answer
  	end
  end
end
