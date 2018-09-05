class Image < ApplicationRecord
  has_many :idea_images
  has_many :ideas, through: :idea_images
  validates_presence_of :url
end
