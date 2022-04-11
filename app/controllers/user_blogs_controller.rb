class UserBlogsController < ApplicationController
  before_action :authenticate_user!, expect:[:index, :show]
  before_action :find_user_blog, only:[:edit, :update, :destroy]

  def index
    @blog = Blog.find(params[:blog_id])
    @user_blogs = @blog.user_blogs.all
  end

  def new
    @user_blog = UserBlog.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @user = User.find_by(params[:email])
    @user_blog = UserBlog.find_by(user_id: @user,blog_id: @blog) 
   
      if @user_blog.present?
        flash.alert = "此用戶已是部落格成員"
      else 
        # @user.blogs << Blog.find_by(params[:id]) 
        # @user.user_blogs.last.update(role: 1)
        # UserBlog.create(user: @user, blog: @blog, role: set_role[:role])
        @user.user_blogs.create(user: @user, blog: @blog, role: set_role[:role])
        # binding.pry
        redirect_to blog_user_blogs_path, notice: "新增管理員成功!"
      end
  end


  def destroy
    @user_blog = UserBlog.find(params[:id])
    @user_blog.destroy
    redirect_to blog_user_blogs_path, notice: "刪除管理員成功!"
  end

  private

  def set_role
    params.require(:user_blogs).permit(:role, :email)
  end

  def find_user_blog
    @user_blog = UserBlog.find(params[:id])
  end
end
