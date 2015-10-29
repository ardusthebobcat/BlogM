class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :comments
  belongs_to :user
  ## has_many :comments? <-- Future version
  validates :title, :presence => true
end
