class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation :email_downcase
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}


  private

  def email_downcase
    email.downcase!
  end
end
