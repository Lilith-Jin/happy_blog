class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_blog, only:[:index, :new, :create]

  def index
    @articles = @blog.articles
  end

  def new
    @article = Article.new
  end

  def create
    @article = @blog.articles.new(article_params)
    if @article.save
      redirect_to blog_articles_path, notice: "文章新增成功" 
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_blog
    @blog = current_user.blogs.find(params[:blog_id])
  end
end
