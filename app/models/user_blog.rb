class UserBlog < ApplicationRecord
  belongs_to :user_id
  belongs_to :blog_id
end
