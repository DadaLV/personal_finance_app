class StatisticsController < ApplicationController
  include StatisticsHelper
  
  def index
    @data_for_chart = []
    operations_data = Operation.all.map { |op| [op.odate.strftime("%B %d, %Y"), op.description, op.amount.to_s, op.category.name ] }
    operations_data_sorted = operations_data.sort

    @dates = operations_data_sorted.map { |e| e[0] }
    @amount = operations_data_sorted.map { |e| e[2].to_i }
    @data_for_chart += operations_data
    @operation_name = operations_data_sorted.map { |e| e[1] }
    @operation_category = operations_data_sorted.map { |e| e[3] } 
  
  end

  
def stati
  
  if params[:my_category].present?
    category = Category.find_by(id: params[:my_category])
    operations = category.present? ? category.operations : Operation.all
  else  
  operations = Operation.all
end
  
  if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date]) +1.day
      operations = operations.where(odate: start_date..end_date)
    
  end
  

    operations_data = operations.map { |op| [op.odate.strftime("%B %d, %Y"), op.description, op.amount.to_s, op.category.name ] }
    operations_data_sorted = operations_data.sort

    @dates = operations_data_sorted.map { |e| e[0] }
    @amount = operations_data_sorted.map { |e| e[2].to_i }
    @operation_name = operations_data_sorted.map { |e| e[1] }
    @operation_category = operations_data_sorted.map { |e| e[3] }

end

  def generate_month_options(from, to)
    (from..to).map { |date| [date.strftime("%B %Y"), date.strftime("%Y-%m")] }.uniq
  end

  def doughnut_chart_data(month, category_id = nil)
    @categories = Category.all
    data = []

    if month.is_a?(Range)
      month_range = month
    else
      month_range = month.beginning_of_month..month.end_of_month
    end

    @categories.each do |category|
      amount = Operation.where(category_id: category_id || category.id, odate: month_range).sum(:amount)
      data << { label: category.name, value: amount }
    end

    return data
  end

  def select_by_category
    @selected_month = params[:month] ? Date.strptime(params[:month], '%Y-%m') : Date.today.beginning_of_month
    @data_for_chart = doughnut_chart_data(@selected_month.beginning_of_month..@selected_month.end_of_month)
    @months = generate_month_options(Date.today.beginning_of_year, Date.today.end_of_month)
    
  end
end
