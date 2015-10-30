class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      #t.references :categorable, polymorphic: true, index: true
      t.integer :category_links_count

      t.timestamps null: false
    end
  end
end
