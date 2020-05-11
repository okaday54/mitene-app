class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :invitable,
         :authentication_keys => [:login], invite_for: 24.hours

  validates :username, presence: true

  has_many :comments
  
  # devise :invitable
end
