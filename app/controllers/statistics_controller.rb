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
end
#  