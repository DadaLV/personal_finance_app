class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def edit
    
  end

end