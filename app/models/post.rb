class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments
  has_one_attached :avatar
end
