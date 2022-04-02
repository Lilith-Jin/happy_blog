class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_blog, only:[:index, :new, :create]
  before_action :find_article, except:[:index, :new, :create]

  def index
    @articles = @blog.articles
  end

  def new
    @article = Article.new
  end

  def create
    @article = @blog.articles.build(article_params)
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
    if @article.update(article_params)
    redirect_to blog_articles_path, notice:"文章更新成功"
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to blog_articles_path, notice:"文章刪除成功"
    
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_blog
    @blog = current_user.blogs.find(params[:blog_id])
  end

  def find_article
    @article = Article.find(params[:id])
  end 

end
