class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 255 }
  validates :status, presence: true, length: { maximum: 10 }
  validates :buy_date, presence: true, length: { maximum: 30 }
end
