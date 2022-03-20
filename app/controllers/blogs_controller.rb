class BlogsController < ApplicationController
  before_action :authenticate_user!, expect:[:index, :show]
  before_action :find_blog, only:[:edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.new(blog_params)

    if @blog.save
      UserBlog.create(user: current_user,
                      blog: @blog,
                      role: "admin")

      redirect_to blogs_path, notice: "新增部落格成功!"
    else
      flash.alert = "部落格新增未成功。"
      render :new
    end
  end

  def show
  end

  def edit
    # @blog = Blog.find(params[:blog_id])
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "部落格更新成功"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "部落格刪除成功"
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def find_blog
    @blog = current_user.blogs.find(params[:id])
  end
end
