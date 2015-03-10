class AddCatalogueToSpreeProducts < ActiveRecord::Migration
  def change
  	add_column :spree_products, :catalogue, :integer
  end
end
