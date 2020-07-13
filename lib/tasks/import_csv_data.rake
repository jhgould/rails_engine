require "csv"


desc "Import all CSV data"

  task import_csv: :environment do

    Customer.destroy_all
    InvoiceItem.destroy_all
    Invoice.destroy_all
    Item.destroy_all
    Merchant.destroy_all
    Transaction.destroy_all

    puts "Old Records Destroyed.."

    customer_data = 'lib/data/customers.csv'
    item_data = 'lib/data/items.csv'
    merchant_data = 'lib/data/merchants.csv'
    invoice_data = 'lib/data/invoices.csv'
    invoice_item_data = 'lib/data/invoice_items.csv'
    transaction_data = 'lib/data/transactions.csv'


    CSV.foreach(customer_data, headers: true) do |row|
      Customer.create(row.to_hash)
    end

    puts "Customer data created.."

    CSV.foreach(invoice_item_data, headers: true) do |row|
      InvoiceItem.create(
        id: row['id'].to_i,
        quantity: row['quantity'],
        item_id: row['item_id'],
        invoice_id: row['invoice_id'],
        created_at: row['created_at'],
        updated_at: row['updated_at'],
        unit_price: row['unit_price'].insert(-3, '.').to_f)
      end

    puts "Invoice Items data created.."

    CSV.foreach(invoice_data, headers: true) do |row|
      Invoice.create(row.to_hash)
    end

    puts "Invoce data created.."

    CSV.foreach(item_data, headers: true) do |row|
      Item.create(id: row['id'].to_i,
        name: row['name'],
        description: row['description'],
        merchant_id: row['merchant_id'],
        created_at: row['created_at'],
        updated_at: row['updated_at'],
        unit_price: row['unit_price'].insert(-3, '.').to_f)
      end

    puts "Item data created.."

    CSV.foreach(merchant_data, headers: true) do |row|
      Merchant.create(row.to_hash)
    end

    puts "Merchant data created.."

    CSV.foreach(transaction_data, headers: true) do |row|
      Transaction.create(row.to_hash)
    end

    puts "Transaction data created.."
    puts "CSV imported"
  end