require 'rails_helper'

describe IdeaImage, type: :model do
  describe 'validations' do
    it {should validate_presence_of :idea_id}
    it {should validate_presence_of :image_id}
  end

  describe 'relationships' do
    it {should belong_to :idea}
    it {should belong_to :image}
  end
end
