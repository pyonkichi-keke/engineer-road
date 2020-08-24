class Message < ApplicationRecord
  belongs_to :group
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user

  mount_uploader :image, ImageUploader

  def self.search(search)
    if search != ""
      Message.where('title LIKE(?)', "%#{search}%")
    else
      Message.all
    end
  end

  validates :title, presence: true
  validates :content, presence: true

end
