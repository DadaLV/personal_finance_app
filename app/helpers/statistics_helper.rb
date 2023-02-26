module StatisticsHelper
  def generate_month_options(start_date, end_date)
    months = []
    (start_date..end_date).each do |date|
      months << [date.strftime("%B %Y"), date.strftime("%Y-%m")]
    end
    return months
  end

  # def doughnut_chart_data(month, category_id = nil)
  #   @categories = Category.all
  #   data = []

  #   if month.is_a?(Range)
  #     month_range = month
  #   else
  #     month_range = month.beginning_of_month..month.end_of_month
  #   end

  #   @categories.each do |category|
  #     amount = Operation.where(category_id: category_id || category.id, odate: month_range).sum(:amount)
  #     data << { label: category.name, value: amount }
  #   end

  #   return data
  # end
  
  # def gen_month_options(from, to)
  #   (from..to).map { |date| [date.strftime("%B %Y"), date.strftime("%Y-%m")] }.uniq
  # end

end
