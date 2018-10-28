class Post < ApplicationRecord
  validates :image, presence: true
  validates :comment, presence: true, length: { maximum: 45 }
  mount_uploader :image, ImageUploader
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  def favorite_user(user_id)
    favorites.find_by(user_id: user_id)
  end

  has_many :recomments
end
