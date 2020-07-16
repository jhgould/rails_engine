class Api::V1::MerchantsBiController < ApplicationController
  def index
    quantity = params[:quantity].to_i
    # merchants = Merchant.joins(invoices: [:invoice_items, :transactions]).where("invoices.status='shipped' and transactions.result='success'").select("merchants.name,  sum(invoice_items.quantity * invoice_items.unit_price) as revenue").group("merchants.name").order("revenue desc").limit(quantity)
    merchants = Merchant.joins(invoices: [:invoice_items, :transactions]).where("invoices.status='shipped' and transactions.result='success'").select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue").group("merchants.id").order("revenue desc").limit(quantity)
    render json: MerchantSerializer.new(merchants)

  end

  def show
    quantity = params[:quantity].to_i
    merchants = Merchant.joins(invoices: [:invoice_items, :transactions]).where("invoices.status='shipped' and transactions.result='success'").group("merchants.id").select("merchants.*, sum(invoice_items.quantity) as items_sold").order("items_sold desc").limit(quantity)
    render json: MerchantSerializer.new(merchants)
  end


end
