class Favorite < ApplicationRecord
  belongs_to :message
  has_many :users
end
