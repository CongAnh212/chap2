class User < ApplicationRecord
  has_many :microposts, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: URI::MailTo::EMAIL_REGEXP },
            uniqueness: true

  before_save { self.email = email.downcase }

end
