class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    
    if @order_detail.update(order_detail_params)
      
      if @order_detail.making_status == "production_completed"
      @order = @order_detail.order
      @order.update(status: :"preparing_to_ship") if @order.order_details.all? { |detail| detail.making_status == "production_completed" }
      elsif @order_detail.making_status == "in_production"
      @order = @order_detail.order
      @order.update(status: :"sent")
      end
      
      redirect_to admin_order_path(@order_detail.order)
    end
    
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:production_method)
  end
  
end
