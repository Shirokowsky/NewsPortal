class CategoryLink < ActiveRecord::Base
  belongs_to :categorable, polymorphic: true
  belongs_to :category, counter_cache: true
end