class QueriesController < ApplicationController
  def show; end

  def perform
    @result = Employee.filter_records(params[:flag])
    render 'show'
  end
end
