class StatisticsController < ApplicationController
    before_action :require_user
    def index
    end
  
    def select_by_category
      start_date = params[:start_date].present? ? Date.parse(params[:start_date]) : nil
      end_date = params[:end_date].present? ? Date.parse(params[:end_date]) : nil

      operations = current_user.operations
      operations = operations.where(odate: start_date..end_date) if start_date && end_date
      @data = operations.data_for_reports(start_date, end_date).group("category_id").sum(:amount)
  
      operations_data = @data.transform_keys { |category| Category.find_by(id: category).name }.to_a
  
      @operations_name = operations_data.map { |e| e[0] }
      @operations_amount = operations_data.map { |e| e[1] }
      @operations = operations.order(odate: :desc)
    end
  
    def stati
      start_date = params[:start_date].present? ? Date.parse(params[:start_date]) : nil
      end_date = params[:end_date].present? ? Date.parse(params[:end_date]) : nil
    
      user_operations = current_user.operations
      @current_user_operations = user_operations.where(odate: start_date..end_date) if start_date && end_date
      operations_data = user_operations.data_for_reports(start_date, end_date).group("odate").sum(:amount)
    
      @operations_date = operations_data.map { |key, value| key.strftime("%B %d, %Y") }
      @operations_sum = operations_data.map { |key, value| value }
    end
    
  
end
