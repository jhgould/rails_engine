class Api::V1::MerchantItemsController < ApplicationController
  def index
    merchant = Merchant.find(params[:id])
    render json: MerchantSerializer.new(merchant.items)
  end
end
