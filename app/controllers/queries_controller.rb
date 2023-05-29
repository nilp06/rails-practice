class QueriesController < ApplicationController
  def task1
    @result = Customer.orders_sum_by_customer('quantity')
  end

  def task2
    @result = Customer.orders_sum_by_customer('total_price')
  end

  def task3
    @result = Customer.orders_by_status('booked')
  end

  def task4
    @result = Customer.orders_by_status('canceled')
  end
end
