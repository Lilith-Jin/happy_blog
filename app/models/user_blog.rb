class UserBlog < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  enum role: { admin: 0, manager: 1, viewer: 2 },_default: :viewer
end
