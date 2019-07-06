class User < ApplicationRecord
  has_secure_password
  has_many :boards, dependent: :destroy
  validates :email, uniqueness: true
end
