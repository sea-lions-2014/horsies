class CreateCards < ActiveRecord::Migration
  def change
  	create_table :cards do |t|
  		t.string :question, :answer, :category
  	end
  end
end
