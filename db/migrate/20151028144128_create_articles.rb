class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.text :text
      t.boolean :accepted, default: false

      t.timestamps null: false
    end
    add_index :articles, [:title]
  end
end
