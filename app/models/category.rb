class Category < ApplicationRecord
  resourcify
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 1000 }

  has_many :messages
  belongs_to :user
end
