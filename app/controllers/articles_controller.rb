class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_blog, only:[:index, :new, :create]
  # before_action :find_article, except:[:index, :show, :edit, :update, :destroy]
  before_action :check_article_authority, only: [:edit, :update, :destroy]

  def index
    @articles = @blog.articles
  end

  def new
    @article = Article.new
  end

  def create
    # byebug
    @article = @blog.articles.build(article_params)
    if @article.save
      redirect_to blog_path(@blog.id), notice: "文章新增成功" 
    else
      render :new
    end
  end

  def show
    
  end

  def edit
  end

  def update
    if @article.status != "true"
      @article.update(status: "false ")
    else
      @article.update(status: "true")
    end
    if @article.update(article_params)
    redirect_to blogs_path, notice:"文章更新成功"
    else
      render :edit
    end
  end

  def destroy
    
    # if current_user.blogs.map{|b|b.articles}.map{ |a| a.pluck(:id)}.flatten.include?(Article.find(params[:id]).id)
    #   @article = Article.find(params[:id])
    if @article.destroy
      redirect_to blogs_path, notice:"文章刪除成功"
    else
      redirect_to blog_articles_path, notice:"很抱歉，您非此部落格管理員"
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :status)
  end

  def find_blog
    # byebug
    @blog = Blog.find(params[:blog_id])
  end

  def find_article
    if current_user.blogs.ids.include?(Blog.find(params[:blog_id]).id)
    @article = Article.find(params[:id])
    else

      redirect_to blogs_path(@blog), notice:"很抱歉，您非此部落格管理員"
    end
  end 

  def check_article_authority
    if current_user.blogs.map{|b|b.articles}.map{ |a| a.pluck(:id)}.flatten.include?(Article.find(params[:id]).id)
      @article = Article.find(params[:id])
    else
      redirect_to blog_articles_path, notice:"很抱歉，您非此部落格管理員"
    end
  end

end
