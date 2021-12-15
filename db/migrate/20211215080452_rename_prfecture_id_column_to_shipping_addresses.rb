class RenamePrfectureIdColumnToShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :shipping_addresses, :prfecture_id, :prefecture_id
  end
end
