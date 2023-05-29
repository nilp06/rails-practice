class Customer < ApplicationRecord
  validates :email, uniqueness: true
  validates :phone_number, numericality: { length: 10 }
  has_many :orders, dependent: :destroy

  scope :orders_sum_by_customer, lambda { |criteria|
                                   Customer.joins(:orders).group(:id).order("sum(#{criteria}) desc").limit(3)
                                 }
  scope :orders_by_status, lambda { |status_criteria|
                             Customer.joins(:orders).where(orders: { status: status_criteria }).group(:first_name, :last_name).count.sort_by do |_, v|
                               v
                             end.reverse.first(5)
                           }
end
