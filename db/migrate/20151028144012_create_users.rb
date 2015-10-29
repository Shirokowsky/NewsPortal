class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.boolean :admin

      t.timestamps null: false
    end
    add_index :users, [:nickname]
  end
end
