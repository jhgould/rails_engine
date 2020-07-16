class Api::V1::MerchantFindController < ApplicationController
  def index
    name = params[:name].downcase
    merchants = Merchant.find_merchant_by_name_fragment(name)
    render json: MerchantSerializer.new(merchants)
  end

  def show
    fragment = params[:name].downcase

    merchants = Merchant.find_first_merchant_by_name_fragment(fragment)
    render json: MerchantSerializer.new(merchants)
  end
end
