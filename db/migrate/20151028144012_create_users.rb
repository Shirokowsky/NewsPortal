class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :role

      t.timestamps null: false
    end
    add_index :users, [:nickname]
  end
end
