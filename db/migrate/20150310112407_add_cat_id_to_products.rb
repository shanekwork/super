class AddCatIdToProducts < ActiveRecord::Migration
  def change
    add_reference :spree_products, :catalogue, index: true
  end
end
