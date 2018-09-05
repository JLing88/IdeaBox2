class Category < ApplicationRecord
  has_many :ideas
  validates_presence_of :title
end
