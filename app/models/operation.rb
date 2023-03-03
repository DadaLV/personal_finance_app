class Operation < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :odate, presence: true
  validates :description, presence: true, length: { minimum: 3, maximum: 100 }

  scope :data_for_reports, -> (start_date, end_date) {
    operations = where(odate: start_date..end_date)
    operations
  }

end