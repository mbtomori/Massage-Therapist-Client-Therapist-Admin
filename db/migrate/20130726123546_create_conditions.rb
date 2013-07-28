class CreateConditions < ActiveRecord::Migration
  def change
  	create_table :conditions do |t|
  		# t.belongs_to :user #DOUBLE CHECK
  		t.string :description
      t.integer :patient_id
  		t.timestamps
  	end
  end
end
