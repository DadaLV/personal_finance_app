class StatisticsController < ApplicationController
  def index
        @start_date = params[:start_date] || 1.year.ago.to_date
        @end_date = params[:end_date] || Date.today
        operation_ids = params[:operations] || Operation.pluck(:id)
    
        operations = Operation.where(id: operation_ids).where(odate: @start_date..@end_date)
    
        # Overall statistics
        total_count = operations.count
    
        # Statistics by year
        by_year = operations.group_by_year(:odate).count
    
        # Statistics by month
        by_month = operations.group_by_month(:odate).count
    
        # Statistics by day
        by_day = operations.group_by_day(:odate).count
    
        @statistics = {
          total_count: total_count,
      by_year: by_year,
      by_month: by_month,
      by_day: by_day
    }

    respond_to do |format|
      format.html
      format.json { render json: @statistics }
    end
  end

  def statistics
    @start_date = params[:start_date]&.to_date || 1.year.ago.to_date
    @end_date = params[:end_date]&.to_date || Date.today
  
    # get all operations within the selected period
    @operations = Operation.where(odate: @start_date..@end_date)
  
    # calculate the total amount of all operations within the selected period
    @total_amount = @operations.sum(:amount)
  
    # group operations by year, month, and day
    @grouped_by_year = @operations.group_by_year(:odate).sum(:amount)
    @grouped_by_month = @operations.group_by_month(:odate).sum(:amount)
    @grouped_by_day = @operations.group_by_day(:odate).sum(:amount)
  
    # get all categories
    @categories = Category.all
  end

end