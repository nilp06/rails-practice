class QueriesController < ApplicationController
  def show; end

  def perform
    @result = case params[:flag]
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
                @result_diff = Employee.select(:first_name, :age, :salary).reselect(:age, :salary)
              else
                Employee.all.reverse_order
              end
    render 'show'
  end
end
