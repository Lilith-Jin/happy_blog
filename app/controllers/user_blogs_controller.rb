class UserBlogsController < ApplicationController
  before_action :authenticate_user!, expect:[:index, :show]

  def index
    @blog = Blog.find(params[:blog_id])
    @user_blogs = @blog.user_blogs.all
  end

  def new
    @user_blog = UserBlog.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @user = User.find_by(email: set_role[:email])
    user_blog = UserBlog.find_by(user_id: @user, blog_id: @blog) 
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
