class CreateConditions < ActiveRecord::Migration
  def change
  	create_table :conditions do |t|
      t.integer :patient_id
  		t.string :description
  		t.timestamps
  	end
  end
end
