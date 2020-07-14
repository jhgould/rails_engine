class Api::V1::MerchantFindController < ApplicationController
  def index
    name = params[:name].downcase
    merchants = Merchant.where("name like '%#{name}%'")
    render json: MerchantSerializer.new(merchants)
  end
end
# ame = "Manhattan"
# Movie.where("title like ?", "%#{name}%")

# Client.where("orders_count = '2'").

# Client.where("first_name LIKE '%#{params[:first_name]}%'")

# Schiller

#Schroeder-Jerde
