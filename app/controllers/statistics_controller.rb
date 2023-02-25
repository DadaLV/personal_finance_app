class StatisticsController < ApplicationController
  
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
  # @my_categories = Category.all
  if params[:my_category].present?
    category = Category.find_by(id: params[:my_category])
    # operations = operations.where(category: category)
    operations = category.present? ? category.operations : Operation.all
  else  
  operations = Operation.all
end
  
  if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date]) +1.day
      operations = operations.where(odate: start_date..end_date)
    
  end
  

  # @data_for_chart = []
    operations_data = operations.map { |op| [op.odate.strftime("%B %d, %Y"), op.description, op.amount.to_s, op.category.name ] }
    operations_data_sorted = operations_data.sort

    @dates = operations_data_sorted.map { |e| e[0] }
    @amount = operations_data_sorted.map { |e| e[2].to_i }
    # @data_for_chart += operations_data
    @operation_name = operations_data_sorted.map { |e| e[1] }
    @operation_category = operations_data_sorted.map { |e| e[3] }

end


end
