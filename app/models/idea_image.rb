class IdeaImage < ApplicationRecord
  belongs_to :idea
  belongs_to :image
  validates_presence_of :idea_id
  validates_presence_of :image_id
end
