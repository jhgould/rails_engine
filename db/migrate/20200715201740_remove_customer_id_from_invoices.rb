class RemoveCustomerIdFromInvoices < ActiveRecord::Migration[5.2]
  def change
    remove_column :invoices, :customer_id, :integer
  end
end
