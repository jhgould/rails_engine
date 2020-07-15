class Item < ApplicationRecord
  belongs_to :merchant, :dependent => :destroy
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

end
