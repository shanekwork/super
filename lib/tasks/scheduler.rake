require 'csv'

task :xmlord => :environment do
  desc "Load all data into XML and save on S3"
  if ImportControl.count==0
    @order = Spree::Order.all
    @import_control = ImportControl.create(:last_id=> @order.last.id)
  else
    @import_control = ImportControl.first
    @order = Spree::Order.where("id>?",@import_control.last_id)
    if @order.length > 0
      @import_control.update_attribute(:last_id,@order.last.id)
    end
  end

  if @order.length > 0
    @address = Spree::Address.all
    @user = Spree::User.all
    tmp_filename="#{Rails.root}/tmp/orders#{DateTime.now}.xml"
    file = File.new(tmp_filename, 'w')
   
    xml = Builder::XmlMarkup.new(target: file, :indent => 4)
    xml.instruct! :xml, :version=>'1.0'
   
      @order.each do |o|
        xml.Order do

          xml.OrderReferences do
            xml.BuyersOrderNumber o.id
            xml.PORef "blank"
          end

          xml.OrderDate o.completed_at

          xml.OrderTotal do
            xml.GoodsValue o.total
            xml.GoodsTax o.id
            xml.TaxTotal o.id
            xml.AmountPaid o.payment_total
          end

          xml.Buyer do
            xml.BuyerReferences do
              xml.SuppliersCodeForBuyer o.id
            end
            xml.Party "blank"
            xml.Address do
              xml.AddressLine o.payment_total
              xml.City "blank"
              xml.State "blank"
              xml.PostCode o.id
              xml.Country "IE"
            end
            xml.Contact do
              xml.Name "blank"
              xml.DDI o.id
              xml.Email o.email
            end
          end

          xml.InvoiceTo do
            xml.Party "blank"
            xml.Address do
              xml.AddressLine "blank"
              xml.City "blank"
              xml.State "blank"
              xml.PostCode o.id
              xml.Country "IE"
            end
            xml.Contact do
              xml.Name "blank"
              xml.DDI o.id
              xml.Email "blank"
            end
          end

          xml.Delivery do
            xml.DeliverTo do
              xml.Party "blank"
              xml.Address do
                xml.AddressLine "blank"
                xml.City "blank"
                xml.State "blank"
                xml.PostCode o.id
                xml.Country "blank"
              end
              xml.Contact do
                xml.Name "blank"
                xml.DDI o.id
                xml.Email "blank"
              end
              xml.DeliverToReferences do
                xml.BuyersCodeForLocation o.id
              end
            end
          end

          xml.OrderLine do
            xml.LineNumbers "blank"
            xml.Product do
              xml.SuppliersProductCode o.id
              xml.Description "blank"
            end
            xml.Quantity do
              xml.Amount o.id
            end
            xml.Price do
              xml.UnitPrice o.id
              xml.LineTax do
                xml.TaxRate o.id
                xml.TaxValue o.id
              end
            end
            xml.CostCentre o.id
          end

          xml.OrderLine do
            xml.LineNumbers o.id
            xml.Product do
              xml.SuppliersProductCode o.id
              xml.Description "blank"
            end
            xml.Quantity do
              xml.Amount o.id
            end
            xml.Price do
              xml.UnitPrice o.id
              xml.LineTax do
                xml.TaxRate o.id
                xml.TaxValue o.id
              end
            end
            xml.CostCentre o.id
          end

          xml.OrderLine do
            xml.LineNumbers o.id
            xml.Product do
              xml.SuppliersProductCode o.id
              xml.Description "blank"
            end
            xml.Quantity do
              xml.Amount o.id
            end
            xml.Price do
              xml.UnitPrice o.id
              xml.LineTax do
                xml.TaxRate o.id
                xml.TaxValue o.id
              end
            end
            xml.CostCentre o.id
          end

          xml.OrderLine do
            xml.LineNumbers o.id
            xml.Product do
              xml.SuppliersProductCode o.id
              xml.Description "blank"
            end
            xml.Quantity do
              xml.Amount o.id
            end
            xml.Price do
              xml.UnitPrice o.id
              xml.LineTax do
                xml.TaxRate o.id
                xml.TaxValue o.id
              end
            end
            xml.CostCentre "blank"
          end

          xml.OrderLine do
            xml.LineNumbers o.id
            xml.Product do
              xml.SuppliersProductCode o.id
              xml.Description "blank"
            end
            xml.Quantity do
              xml.Amount o.id
            end
            xml.Price do
              xml.UnitPrice o.id
              xml.LineTax do
                xml.TaxRate o.id
                xml.TaxValue o.id
              end
            end
            xml.CostCentre o.id
          end

          xml.OrderLine do
            xml.LineNumbers o.id
            xml.Product do
              xml.SuppliersProductCode o.id
              xml.Description "blank"
            end
            xml.Quantity do
              xml.Amount o.id
            end
            xml.Price do
              xml.UnitPrice o.id
              xml.LineTax do
                xml.TaxRate o.id
                xml.TaxValue o.id
              end
            end
            xml.CostCentre o.id
          end
        
        end
      end
    
    file.close

    # Write the file out to S3
    print "--- setting up Amazon s3 connection ---"
    amazon = S3::Service.new(access_key_id:ENV["AWS_ACCESS_KEY_ID"] , secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"])
    bucket = amazon.buckets.find("superbots")
    s3_file = bucket.objects.build("imports/orders#{DateTime.now}.xml")
    f = File.open(tmp_filename,'r')

    s3_file.content = f.read
    s3_file.save
    print "--- writing file ----"
  else
    print "--- No new orders to process ---"
  end
end