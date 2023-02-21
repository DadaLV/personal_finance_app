class OperationsController < ApplicationController
  before_action :set_operation, only: [:show, :edit, :update, :destroy]

  def index
    @operations = Operation.all 
  end

  def show
    
  end

  def new
    @operation = Operation.new
  end

  def create
    @operation = Operation.new(operation_params)
    if @operation.save
      flash[:notice] = "Operation was seccessfully created."
      redirect_to @operation
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @operation.update(operation_params)
      flash[:notice] = "Operation was successfully updated."
      redirect_to @operation 
    else
      render "edit"
    end
  end

  def destroy
    @operation.destroy
    flash[:notice] = "Operation was successfully deleted"
    redirect_to operations_url
  end

  private

  def set_operation
    @operation = Operation.find(params[:id])
  end

  def operation_params
    params.require(:operation).permit(:description, :amount, :odate, :category_id)
  end

end