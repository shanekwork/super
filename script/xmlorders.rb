require 'builder'
@order = Spree::Order.all.limit(5)
    file = File.new("#{Rails.root}/public/orders.xml", 'w')
 
    xml = Builder::XmlMarkup.new(target: file, :indent => 2)
    xml.instruct! :xml, :version=>'1.0'
 
    xml.tag! 'orders' , 'version' => '1.0' do
      xml.array do
        @order.each do |o|
          xml.order do
            xml.key 'item_total'
            xml.string o.item_total
            xml.key 'total'
            xml.string o.total
            xml.key 'user_id'
            xml.string o.user_id
            xml.key 'completed_at'
            xml.string o.completed_at
            xml.key 'email'
            xml.string o.email
            xml.key 'special_instructions'
            xml.string o.special_instructions
            xml.key 'bill_address_id'
            xml.string o.bill_address_id
            xml.key 'ship_address_id'
            xml.string o.ship_address_id
          end
        end
      end
    end