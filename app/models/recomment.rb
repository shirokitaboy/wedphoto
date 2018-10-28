class Recomment < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  validates :content, length: { in: 1..45 }
end
