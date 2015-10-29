class Article < ActiveRecord::Base
  include Has_comments
  
  belongs_to :patternable, polymorphic: true

  validates :title, :description, :text, presence: true

  default_scope { order(created_at: :asc)}
  scope :accepted, -> {where(accepted: true)}
end
