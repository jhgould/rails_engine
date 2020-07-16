class Api::V1::ItemsFindController < ApplicationController
  def index
    fragment = params[:name].downcase
    items = Item.find_by_fragment(fragment)
    render json: ItemSerializer.new(items)
  end

  def show
    fragment = params[:name].downcase
    items = Item.find_first_by_fragment(fragment)
    render json: ItemSerializer.new(items)
  end
end
