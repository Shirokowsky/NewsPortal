class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.text :text
      t.boolean :accepted, default: false
      t.boolean :rejected, default: false
      t.references :patternable, polymorphic: true, index: true
      t.references :categorable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
