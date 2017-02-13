class Category < ApplicationRecord
  validates :title, presence: true

  has_many :messages
  belongs_to :user
end
