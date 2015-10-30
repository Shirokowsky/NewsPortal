class Article < ActiveRecord::Base
  include HasComments
  include HasCategories
  
  belongs_to :patternable, polymorphic: true

  validates :title, :description, :text, presence: true

  default_scope { order(created_at: :asc)}
  scope :accepted, -> {where(accepted: true)}

  self.per_page = 5
end
