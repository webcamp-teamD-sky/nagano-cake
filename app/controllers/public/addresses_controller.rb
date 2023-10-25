class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.where(customer_id: current_customer.id)
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    if address.save
      flash[:notice] = "配送先を追加しました。"
      redirect_to addresses_path
    else
      flash.now[:notice] = "住所の新規登録に失敗しました。"
      render :index
    end
  end

  def update
    address = Address.find(params[:id])

    if address.update(address_params)
      flash[:notice] = "住所の編集が完了しました。"
      redirect_to addresses_path
    else
      @address = Address.find(params[:id])
      flash.now[:notice] = "住所の編集に失敗しました。"
      render :edit
    end

  end

  def destroy
    address = Address.find(params[:id])

    if address.destroy
      flash[:notice] = "住所を削除しました。"
      redirect_to addresses_path
    else
      flash[:notice] = "住所の削除に失敗しました。"
      @addresses = Address.where(customer_id: current_customer.id)
      @address = Address.new
      redirect_to :index
    end

  end

  private
  def address_params
    params.require(:address).permit(:postcode, :address, :name)
  end

end