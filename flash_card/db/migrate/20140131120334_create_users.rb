class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name, :password
  	end
  end
end
