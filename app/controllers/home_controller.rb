class HomeController < ApplicationController
  def index
    @blogs = Blog.includes(:user_blogs)
  end
end
