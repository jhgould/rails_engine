class Api::V1::ItemsFindController < ApplicationController
  def index
    fragment = params[:name].downcase
    items = Item.where("lower(name) like '%#{fragment}%'")
    render json: ItemSerializer.new(items)
  end

  def show
    fragment = params[:name].downcase
    items = Item.where("lower(name) like '%#{fragment}%'").first
    render json: ItemSerializer.new(items)
  end
end
