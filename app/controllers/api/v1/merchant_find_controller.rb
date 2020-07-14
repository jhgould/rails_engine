class Api::V1::MerchantFindController < ApplicationController
  def index
    name = params[:name].downcase
    merchants = Merchant.where("lower(name) like '%#{name}%'")
    render json: MerchantSerializer.new(merchants)
  end

  def show
    fragment = params[:name].downcase
    merchants = Merchant.where("lower(name) like '%#{fragment}%'").first
    render json: MerchantSerializer.new(merchants)
  end
end
