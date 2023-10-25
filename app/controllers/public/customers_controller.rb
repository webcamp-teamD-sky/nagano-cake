class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def check
  end

  def withdraw
  end
end
