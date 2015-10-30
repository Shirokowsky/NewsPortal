module HasCategories
  def self.included(base)
    base.class_eval do
      has_many :category_links, as: :categorable
      has_many :categories, through: :category_links
      accepts_nested_attributes_for :category_links
    end
  end
end