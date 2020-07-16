class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items, dependent: :destroy
  has_many :items
  has_many :invoices

  def self.find_merchant_by_name_fragment(name)
    where("lower(name) like '%#{name}%'")
  end

  def self.find_first_merchant_by_name_fragment(fragment)
    where("lower(name) like '%#{fragment}%'").first
  end
end
