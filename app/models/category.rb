class Category < ActiveRecord::Base
  belongs_to :categorable, polymorphic: true
  validates :title, presence: true

  has_many :category_links
  has_many :categorables, through: :category_links
  has_many :articles, through: :category_links, source: :categorables
end
