class Category < ApplicationRecord
  validates :title, presence: true, length: { in: 3..20 }

  has_many :messages
  belongs_to :user
end
