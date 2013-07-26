class CreateConditions < ActiveRecord::Migration
  def change
  	create_table :conditions do |t|
  		t.belongs_to :user #DOUBLE CHECK
      t.integer :pressure_preference
  		t.string :description
  		t.timestamps
  	end
  end
end
