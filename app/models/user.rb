class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   # validates :email, presence: true
  has_many :user_blogs, dependent: :delete_all
  has_many :blogs, through: :user_blogs
end
