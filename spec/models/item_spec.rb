require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe 'relationships' do
    it {should belong_to :merchant}
    it {should have_many :invoice_items}
  end

  describe 'methods' do
    it ".find items from name fragment" do
    merchant = Merchant.create(name: "merchant")
    item1 =  Item.create!(name: "headphone", description: "plays bangin tunes", unit_price: 100, merchant_id: merchant.id)
    item2 =  Item.create!(name: "phoneheads", description: "plays bangin tunes", unit_price: 100, merchant_id: merchant.id)

    test = Item.find_by_fragment("one")
    expect(test.count).to eq(2)
    expect(test.first).to eq(item1)
    expect(test.last).to eq(item2)
    end
    it ".find first item from name fragment" do
    merchant = Merchant.create(name: "merchant")
    item1 =  Item.create!(name: "headphone", description: "plays bangin tunes", unit_price: 100, merchant_id: merchant.id)
    item2 =  Item.create!(name: "phoneheads", description: "plays bangin tunes", unit_price: 100, merchant_id: merchant.id)

    test = Item.find_first_by_fragment("one")
    expect(test).to eq(item1)
    expect(test).to_not eq(item2)

    end

  end
end
