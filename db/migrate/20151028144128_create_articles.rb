class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.text :text
      t.boolean :accepted, default: false
      t.integer :patternable_id
      t.string :patternable_type

      t.timestamps null: false
    end
    add_index :articles, [:patternable_id, :patternable_type]
  end
end
