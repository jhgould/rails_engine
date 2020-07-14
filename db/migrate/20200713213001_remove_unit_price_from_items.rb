class RemoveUnitPriceFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :unit_price, :integer
  end
end
