require 'rails_helper'

describe Idea, type: :model do
  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :body}
  end

  describe 'relationships' do
    it {should belong_to :user}
    it {should have_many :idea_images}
    it {should have_many(:images).through(:idea_images)}
  end
end
