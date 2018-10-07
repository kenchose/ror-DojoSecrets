class User < ActiveRecord::Base
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :name, :email, presence: true
  before_save { |user| user.email = user.email.downcase }
  has_many :secrets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret
end
