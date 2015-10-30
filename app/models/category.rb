class Category < ActiveRecord::Base
  belongs_to :categorable, polymorphic: true

  has_many :category_links
  has_many :categorables, through: :category_links
  has_many :articles, through: :category_links, source: :categorable, source_type: 'Article'

  validates :title, presence: true, uniqueness: true
end
