class AddItemIdToInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    add_column :invoice_items, :item_id, :integer
  end
end
