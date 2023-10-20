class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def check
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @postage_fee = 800
    ary = []
    @cart_items.each do |cart_item|
      ary << (cart_item.item.price*1.1 *cart_item.amount).floor
    end
      if params[:order][:address_oprion] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.address_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_option] == "1"
      @address = Address.fnd(params[:order][:order_address]
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.address_name = @address.name

    elsif params[:order][:address_option] = "2"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.address_name = params[:order][:name]
    else

      render 'new'

    end
      @cart_items = current_customer.cart_items.all
      @shipping_fee = 800
      ary = []
      @cart_items.each do |cart_item|
      ary << (cart_item.item.price*1.1 *cart_item.amount).floor
      end
      @cart_items_price = ary.sum
      @selected_pay_method = params[:order][:payment_method]
      @total_price = @shipping_fee + @cart_items_price
  end

  def completion
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.order_status = 0
      if @order.save
        current_customer.cart_items.each do |cart_item| #カート内商品を1つずつ取り出しループ
          @ordered_item = OrderDetail.new #初期化宣言
          @ordered_item.order_id =  @order.id #order注文idを紐付けておく
          @ordered_item.item_id = cart_item.item_id #カート内商品idを注文商品idに代入
          @ordered_item.quantity = cart_item.amount #カート内商品の個数を注文商品の個数に代入
          @ordered_item.price = (cart_item.item.price*1.1).floor #消費税込みに計算して代入
          @ordered_item.save
        end
          redirect_to public_orders_complete_path
            cart_items.destroy_all
    # ユーザーに関連するカートのデータ(購入したデータ)をすべて削除します(カートを空にする)
        else
          render 'new'
        end
          @cart_items = current_customer.cart_items.all
          @shipping_fee = 800
          ary = []
          @cart_items.each do |cart_item|
            ary << (cart_item.item.price*1.1 *cart_item.amount).floor
          end
          @cart_items_price = ary.sum
          @selected_pay_method = params[:order][:payment_method]
          @total_price = @shipping_fee + @cart_items_price
  end

  def index
    @orders = current_customer.orders.latest
    @cart_items = current_customer.cart_items.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @address = @order.postcode + @order.address + @order.address_name
  end
end
