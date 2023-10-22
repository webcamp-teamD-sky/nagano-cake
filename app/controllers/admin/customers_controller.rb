class Admin::CustomersController < ApplicationController
  before_action :get_customer_id, only: [:show, :edit, :update]
  
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end

  def get_customer_id
    @customer = Customer.find(params[:id])
  end
  
end
