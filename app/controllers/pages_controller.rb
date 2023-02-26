class PagesController < ApplicationController

  def home
    @operations = Operation.order(odate: :desc).limit(5)
  end

  def about
    
  end

 
end