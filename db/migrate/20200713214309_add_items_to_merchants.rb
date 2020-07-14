class AddItemsToMerchants < ActiveRecord::Migration[5.2]
  def change
    add_reference :merchants, :items, foreign_key: true
  end
end
