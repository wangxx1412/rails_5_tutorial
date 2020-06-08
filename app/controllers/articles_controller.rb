class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  # Get Form Route Handler
  def new
    @article = Article.new
  end

  # Get to edit
  def edit
    @article = Article.find(params[:id])
  end

  def show
    # use @article to make it available for all actions in this controller
    @article = Article.find(params[:id])
  end

  # Post Form Route Handler
  def create
    @article = Article.new(article_params)
 
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
  
    redirect_to articles_path
  end

  private
  # Reuse for multiple actions
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
