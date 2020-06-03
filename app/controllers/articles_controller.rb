class ArticlesController < ApplicationController
  # Get Form Route Handler
  def new
  end

  # Post Form Route Handler
  def create
    render plain: params[:article].inspect
  end
end
