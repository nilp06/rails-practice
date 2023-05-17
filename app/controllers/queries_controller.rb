class QueriesController < ApplicationController
  def task1
    @result = Customer.joins(:orders).group(:id).order('sum(quantity) desc').limit(3)
  end

  def task2
    @result = Customer.joins(:orders).group(:id).order('sum(total_price) desc').limit(3)
  end

  def task3
    @result = Customer.joins(:orders).where(orders: { status: 'booked' }).group(:first_name,
                                                                                :last_name).count.sort_by { |_, v| v }.reverse.first(5)
  end

  def task4
    @result = Customer.joins(:orders).where(orders: { status: 'canceled' }).group(:first_name,
                                                                                  :last_name).count.sort_by { |_, v| v }.reverse.first(5)
  end
end
