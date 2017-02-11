class Category < ApplicationRecord
  validates :title, presence: true
  validates :body, length: { maximum: 100 }

  has_many :messages
  belongs_to :user
end
