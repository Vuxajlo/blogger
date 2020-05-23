class ArticlesController < ApplicationController
  before_action :require_login, except: [:index, :show]
    include ArticlesHelper
   
   def index 
    @articles = Article.all
   end
    
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
    @article.update_column('view_count', @article.view_count + 1)
    

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
    flash.notice = "Article #{@article.title} Created!"


  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
    flash.notice = "Article #{@article.title} Deleted!"

  end
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
    flash.notice = "Article #{@article.title} Updated!"
  end


end
