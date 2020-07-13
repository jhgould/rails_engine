class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.integer :customer_id
      t.integer :merchant_id
      t.string :status
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
