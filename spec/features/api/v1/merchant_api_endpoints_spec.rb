require 'rails_helper'


RSpec.describe "Test the merchants api endpoints", type: :request do
    it "test merchant index api endpoint" do
      Merchant.create(name: "Merchant 1")
      Merchant.create(name: "Merchant 2")
      Merchant.create(name: "Merchant 3")

      get '/api/v1/merchants'

      expect(response).to be_successful
      merchants = JSON.parse(response.body)
      expect(merchants["data"].count).to eq(3)
    end

    it "test it can find merchant by id" do
      id = Merchant.create(name: "Merchant 1").id
      get "/api/v1/merchants/#{id}"
      merchant = JSON.parse(response.body)
      expect(response).to be_successful
      expect(merchant["data"]["id"].to_i).to eq(id)
    end

    it "test that it can create a merchant" do
      merchant_params = {name: "merchant_name"}

      # post "/api/v1/merchants", params: {merchant: merchant_params}
      post "/api/v1/merchants", params: merchant_params
      merchant = Merchant.last


      expect(response).to be_successful
      expect(merchant.name).to eq(merchant_params[:name])
    end

    it "can update" do
      id = Merchant.create(name: "Merchant 1").id
      previous_name = Merchant.last.name
      merchant_params = {name: "new name"}

      put "/api/v1/merchants/#{id}", params: merchant_params
      # put "/api/v1/merchants/#{id}", params: {merchant: merchant_params}

      merchant = Merchant.find_by(id: id)
      expect(response).to be_successful
      expect(merchant.name).to_not eq(previous_name)
      expect(merchant.name).to eq("new name")
    end

    it "can destroy and item" do
      merchant = Merchant.create(name: "Merchant")

      expect(Merchant.count).to eq(1)
      delete "/api/v1/merchants/#{merchant.id}"

      expect(response).to be_successful
      expect(Merchant.count).to eq(0)
      expect{Merchant.find(merchant.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'can get merchant for an item' do
      merchant1 = Merchant.create(name: "Merchant")
      item1 =  Item.create!(name: "headphone", description: "plays bangin tunes", unit_price: 100, merchant_id: merchant1.id)

      get ("/api/v1/items/#{item1.id}/merchant")
      expect(response).to be_successful
      merchant = JSON.parse(response.body)
      expect(merchant["data"]["id"].to_i).to eq(merchant1.id)
    end


end
