class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_details = OrderDetail.find(params[:id])
    @order = @order_details.order

    if @order_details.update(order_details_params)
      if @order.order_details.any? { |order_details| order_details.production_status == "製作中" }
        @order.update(status: 2)
      elsif @order.order_details.all? { |order_details| order_details.production_status == "完了" }
        @order.update(status: 3)
      end
      redirect_to request.referer
    end
  end

  private

  def order_details_params
    params.require(:order_detail).permit(:production_status)
  end
  
end
