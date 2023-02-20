class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def show
    
  end

  def index
    @categories = Category.all
  end

  def edit
    
  end

  def new
    @category = Category.new
  end
   
  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category was seccessfully created."
      redirect_to @category
    else
      render :new
    end 
  end

  def update
    
    if @category.update(category_params)
      flash[:notice] = "Category was successfully updated."
      redirect_to @category
    else
      render "edit"
    end
  end
  
  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end

end