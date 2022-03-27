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
    
    if user_blog.present?
      flash.alert = "此用戶已是部落格成員"
    else 
      UserBlog.create(user: @user, blog: @blog, role: set_role[:role])
      redirect_to blog_user_blogs_path, notice: "新增管理員成功!"
    end

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_role
    params.require(:user_blogs).permit(:email, :role)
  end
end
