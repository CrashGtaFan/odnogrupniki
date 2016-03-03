class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  has_many :notes
  validates :email, uniqueness: true
  validates_uniqueness_of :email
  has_secure_password
end
