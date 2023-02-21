class ReportsController < ApplicationController

  def index
    # @categories = Category.all
    # @chart_data = []
    # if params[:range]
    #   case params[:range]
    #   when 'day'
    #     @chart_data = Operation.where('odate >= ?', Date.today).group(:category_id).sum(:amount)
    #   when 'week'
    #     @chart_data = Operation.where('odate >= ?', Date.today - 7.days).group(:category_id).sum(:amount)
    #   when 'month'
    #     @chart_data = Operation.where('odate >= ?', Date.today - 1.month).group(:category_id).sum(:amount)
    #   when 'year'
    #     @chart_data = Operation.where('odate >= ?', Date.today - 1.year).group(:category_id).sum(:amount)
    #   when 'custom'
    #     if params[:start_date] && params[:end_date]
    #       start_date = Date.parse(params[:start_date])
    #       end_date = Date.parse(params[:end_date])
    #       @chart_data = Operation.where(odate: start_date..end_date).group(:category_id).sum(:amount)
    #     end
    #   end
    # end
  end
  
end
