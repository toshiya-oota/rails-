class Customer::CustomersController < ApplicationController
  def index
    @q = Customer.ransack(params[:q])
    @customers = @q.result(:distinct => true).page(params[:page] || 1)
  end

  def show; end

  def new; end

  def edit; end
end
