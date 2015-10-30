class CategoryLinks < ActiveRecord::Migration
  def change
    create_table :category_links do |t|
      t.integer :category_id
      t.references :categorable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
