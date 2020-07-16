require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :items}
    it {should have_many :invoices}
  end

  describe 'method test' do

    it ".find_merchant_by_name_fragment" do
      merchant = Merchant.create(name: "merchant")
      merchant1 = Merchant.create(name: "merchants")
      merchant2 = Merchant.create(name: "TJ maxxs")

      test = Merchant.find_merchant_by_name_fragment("ant")
      expect(test.count).to eq(6)

      expect(test).to include(merchant)
      expect(test).to include(merchant1)
    end

    it ".find_first_merchant_by_name_fragment" do
      merchant = Merchant.create(name: "merchant")
      merchant1 = Merchant.create(name: "merchants")

      test = Merchant.find_first_merchant_by_name_fragment("ant")

      expect(test.name).to eq(merchant.name)
      expect(test).to_not eq(merchant1)

    end
  end
end
