class Blog < ApplicationRecord
  validates :title, :content, presence:true

  has_many :user_blogs, dependent: :delete_all
  has_many :users, through: :user_blogs
  has_many :articles
end
