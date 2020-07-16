class Item < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items


  def self.find_by_fragment(fragment)
    where("lower(name) like '%#{fragment}%'")
  end

  def self.find_first_by_fragment(fragment)
    where("lower(name) like '%#{fragment}%'").first
  end

end
