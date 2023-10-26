class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def check
    @addresses = current_customer.addresses
    @order = Order.new(order_params)

    if params[:order][:address_type] == "customer_address"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_option] == "1"
      # あとで
      @address = Address.find(params[:order][:order_address])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_option] == "2"
      # あとで
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      cart_items.destroy_all
      redirect_to public_orders_complete_path
    else
      render 'new'
    end

    @cart_items = current_customer.cart_items.all
    @postage_fee = 800

    ary = []
    @cart_items.each do |cart_item|
      ary << (cart_item.item.price*1.1 *cart_item.amount).floor
    end
    @cart_items_price = ary.sum
    @selected_pay_method = params[:order][:payment_method]
    @total_price = @postage_fee + @cart_items_price

    @order.customer_id = current_customer.id
    @order.total_payment = @total_price
    @order.status = 0
    @order.postage = @postage_fee

  end

  def completion
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.order_status = 0
      if @order.save
        current_customer.cart_items.each do |cart_item|
          @ordered_item = OrderDetail.new
          @ordered_item.order_id =  @order.id
          @ordered_item.item_id = cart_item.item_id
          @ordered_item.quantity = cart_item.amount
          @ordered_item.price = (cart_item.item.price*1.1).floor
          @ordered_item.save
        end
          redirect_to completion_orders_path
            cart_items.destroy_all
        else
          render 'new'
        end
          @cart_items = current_customer.cart_items.all
          @postage_fee = 800
          ary = []
          @cart_items.each do |cart_item|
            ary << (cart_item.item.price*1.1 *cart_item.amount).floor
          end
          @cart_items_price = ary.sum
          @selected_pay_method = params[:order][:payment_method]
          @total_price = @postage_fee + @cart_items_price
  end

  def index
    @orders = current_customer.orders
    @cart_items = current_customer.cart_items.all
  end

  def show
    @order = Order
    # .find(params[:id])
    @orders = @order.all
    # _detail
    # @address = @order.name + @order.postcode + @order.address
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :postcode, :payment_method, :amount)
  end


  def address_params
    params.require(:order).permit(:name, :address, :postcode)
  end

end