require 'rails_helper'


RSpec.describe "Test the items api endpoints", type: :request do
  it "test item index api endpoint" do
    Item.create(name: "headphone", description: "plays bangin tunes", unit_price: 100, merchant_id: 1)
    Item.create(name: "headphone", description: "plays bangin tunes", unit_price: 100, merchant_id: 1)
    Item.create(name: "headphone", description: "plays bangin tunes", unit_price: 100, merchant_id: 1)

    get '/api/v1/items'

    expect(response).to be_successful
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)
  end

  it "test it can find item by id" do
    id = Item.create(name: "headphone", description: "plays bangin tunes", unit_price: 100, merchant_id: 1).id
    get "/api/v1/items/#{id}"
    items = JSON.parse(response.body)
    expect(response).to be_successful
    expect(items["id"]).to eq(id)
  end

  it "can create items" do
    item_params = {name: "bottle", description: "holds water", unit_price: 100, merchant_id: 1}
    post "/api/v1/items", params: {item: item_params}
    item = Item.last

    expect(response).to be_successful
    expect(item.name).to eq(item_params[:name])
  end

  it "can update an item" do
    id = Item.create(name: "bottle", description: "holds water", unit_price: 100, merchant_id: 1).id
    previous_name = Item.last.name
    item_params = {name: "big water bottle", description: "holds way more water", unit_price: 100, merchant_id: 1}

    put "/api/v1/items/#{id}", params: {item: item_params}

    item = Item.find_by(id: id)
    expect(response).to be_successful
    expect(item.name).to_not eq(previous_name)
    expect(item.name).to eq("big water bottle")
  end

  it "can destroy and item" do
    item = Item.create(name: "headphone", description: "plays bangin tunes", unit_price: 100, merchant_id: 1)

    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{item.id}"

    expect(response).to be_successful
    expect(Item.count).to eq(0)
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
