class Recomment < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  validates :content, presence: true, length: { in: 1..45 }
end
