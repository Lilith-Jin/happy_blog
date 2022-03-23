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
    @user = User.find(params[:user_id])
    @user_blog
    user_blog = UserBlog. 
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
