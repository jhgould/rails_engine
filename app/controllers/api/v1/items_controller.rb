class Api::V1::ItemsController < ApplicationController
  def index
    # render json: Item.all
    render json: ItemSerializer.new(Item.all)
  end

  def show
    # render json: Item.find(params[:id])
    render json: ItemSerializer.new(Item.find(params[:id]))
  end

  def create
    # render json: Item.create(item_params)
    # render json: ItemSerializer.new(Item.create(item_params))
    item = Item.create(serialized_item_params)
    item.save!
    render json: ItemSerializer.new(item)
  end

  def update
    render json: ItemSerializer.new(Item.update(params[:id], serialized_item_params))
  end

  def destroy
    render json: ItemSerializer.new(Item.destroy(params[:id]))
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end

  def serialized_item_params
    params.permit(:name, :description, :unit_price, :merchant_id)
  end

end
