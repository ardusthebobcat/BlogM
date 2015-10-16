class Post < ActiveRecord::Base
  # has_many :tags
  ## has_many :comments? <-- Future version
  validates :title, :presence => true
end
