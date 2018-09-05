class Idea < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :idea_images
  has_many :images, through: :idea_images
  validates_presence_of :title
  validates_presence_of :body
end
