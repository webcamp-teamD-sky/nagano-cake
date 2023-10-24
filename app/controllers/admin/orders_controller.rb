class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    
    if @order.update(order_params)
      if @order.status == "confirmation"
        OrderDetail.where(order_id: @order.id).update_all(production_method: "waiting")
      end
      redirect_to admin_order_path, notice: "注文状況を更新しました。"
    else
      flash.now[:danger] = "エラーが発生しました"
      @order_details = @order.order_details
      render 'show'
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana,
      :first_name_kana, :postcode, :address, :phone_number, :email, :is_active)
  end
  
end
