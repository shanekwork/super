class Catalogue < ActiveRecord::Base
	has_many :spree_products, class_name: 'Spree::Product'
end
