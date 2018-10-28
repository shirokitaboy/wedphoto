class Recomment < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  validates :content, length: { maximum: 45 }
end
