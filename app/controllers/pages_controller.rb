class PagesController < ApplicationController

  def home
    @operations = Operation.all
  end

  def about
    
  end

 
end