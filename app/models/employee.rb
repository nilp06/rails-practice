class Employee < ApplicationRecord
  validates :email, uniqueness: true
  default_scope { order(first_name: :asc) }

  def self.filter_records(value)
    result = case value
             when '1'
               Employee.where('age > :great and age < :less', { great: 20, less: 40 })
             when '2'
               Employee.where(full_time_available: true)
             when '3'
               Employee.where('no_of_order = 5 and age > 25')
             when '4'
               Employee.where('created_at < ? ', Date.today)
             when '5'
               Employee.unscope(:order).where('no_of_order = 5 or age < 25')
             when '6'
               Employee.where('age > 20').reorder(age: :desc)
             when '7'
               Employee.where('salary > ? ', 45_000).only(:where)
             when '8'
               Employee.reorder(no_of_order: :desc)
             when '9'
               Employee.where(' no_of_order > 5').only(:where)
             when '10'
               Employee.select(:first_name, :age, :salary).reselect(:first_name, :age)
             else
               Employee.all.reverse_order
             end
  end
end
