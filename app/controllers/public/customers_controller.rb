class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def check
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_delete: true)
    reset_session
    flash[:notice] = "退会しました"
    redirect_to root_path
  end
end
