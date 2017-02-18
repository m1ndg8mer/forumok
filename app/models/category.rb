class Category < ApplicationRecord
  resourcify
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 1000 }

  default_scope { order(id: :desc) }
  scope :published, -> { where(published: true) }

  has_many :messages
  belongs_to :user
end
