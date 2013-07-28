class CreateConditions < ActiveRecord::Migration
  def change
  	create_table :conditions do |t|
  		t.string :description
      t.integer :patient_id
  		t.timestamps
  	end
  end
end
