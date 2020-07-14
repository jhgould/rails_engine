class Api::V1::MerchantsController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

  def create
    # render json: Merchant.create(merchant_params)
    render json: MerchantSerializer.new(Merchant.create(serialized_merchant_params))

  end

  def update
    # render json: Merchant.update(params[:id], merchant_params)
    render json: MerchantSerializer.new(Merchant.update(params[:id], serialized_merchant_params))

  end

  def destroy
    # render json: Merchant.delete(params[:id])
    render json: MerchantSerializer.new(Merchant.destroy(params[:id]))
    # render json: ItemSerializer.new(Item.destroy(params[:id]))


  end

  private

  def merchant_params
    params.require(:merchant).permit(:name)
  end

  def serialized_merchant_params
    params.permit(:name)
  end

end
