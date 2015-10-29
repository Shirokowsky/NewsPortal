class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps null: false
    end
    add_index :categories, [:commentable_id, :commentable_type]
  end
end
