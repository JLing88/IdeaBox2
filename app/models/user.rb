class User < ApplicationRecord
  validates_presence_of :password
  validates :username, uniqueness: true, presence: true

  has_secure_password

  enum role: ["default", "admin"]
end
