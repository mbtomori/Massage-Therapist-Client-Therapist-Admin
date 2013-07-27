class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.string :password_hash
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.integer :pressure_preference
      t.boolean :is_active
      t.string :type
      t.timestamps
    end
  end
end
