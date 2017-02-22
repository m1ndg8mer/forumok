class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_role
  validates :name, presence: true

  has_attached_file :avatar, styles: { medium: "200x200>", thumb: "100x100>" },
                        default_url: ":style/missing.png"
  validates_attachment :avatar, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                        size: { less_than: 1.megabytes }

  has_many :categories
  has_many :messages

  def assign_role
    self.add_role(:user) if self.roles.blank?
  end

end
