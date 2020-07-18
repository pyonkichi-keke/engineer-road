class Message < ApplicationRecord
  belongs_to :group
  has_many :comments
  has_many :favorites
  belongs_to :user
  mount_uploader :image, ImageUploader
end
