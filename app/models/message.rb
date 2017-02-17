class Message < ApplicationRecord
  resourcify
  validates :content, presence: true, length: { maximum: 1000 }

  belongs_to :user
  belongs_to :category
end
