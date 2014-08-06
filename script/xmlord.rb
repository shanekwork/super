require 'builder'
@order = Spree::Order.all.limit(5)
  file = File.new("#{Rails.root}/public/orders.xml", 'w')
 
  xml = Builder::XmlMarkup.new(target: file, :indent => 4)
  xml.instruct! :xml, :version=>'1.0'
 
    @order.each do |o|
      xml.Order do

        xml.OrderReferences do
          xml.BuyersOrderNumber o.id
          xml.PORef "test"
        end

        xml.OrderDate o.id

        xml.OrderTotal do
          xml.GoodsValue o.id
          xml.GoodsTax o.id
          xml.TaxTotal o.id
          xml.AmountPaid o.id
        end

        xml.Buyer do
          xml.BuyerReferences do
            xml.SuppliersCodeForBuyer o.id
          end
          xml.Party "test"
          xml.Address do
            xml.AddressLine "test"
            xml.City "test"
            xml.State "test"
            xml.PostCode o.id
            xml.Country "IE"
          end
          xml.Contact do
            xml.Name "test"
            xml.DDI o.id
            xml.Email "test"
          end
        end

        xml.InvoiceTo do
          xml.Party "test"
          xml.Address do
            xml.AddressLine "test"
            xml.City "test"
            xml.State "test"
            xml.PostCode o.id
            xml.Country "IE"
          end
          xml.Contact do
            xml.Name "test"
            xml.DDI o.id
            xml.Email "test"
          end
        end

        xml.Delivery do
          xml.DeliverTo do
            xml.Party "test"
            xml.Address do
              xml.AddressLine "test"
              xml.City "test"
              xml.State "test"
              xml.PostCode o.id
              xml.Country "test"
            end
            xml.Contact do
              xml.Name "test"
              xml.DDI o.id
              xml.Email "test"
            end
            xml.DeliverToReferences do
              xml.BuyersCodeForLocation o.id
            end
          end
        end

        xml.OrderLine do
          xml.LineNumbers ""
          xml.Product do
            xml.SuppliersProductCode o.id
            xml.Description "test"
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
            xml.Description "test"
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
            xml.Description "test"
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
            xml.Description "test"
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
          xml.CostCentre "test"
        end

        xml.OrderLine do
          xml.LineNumbers o.id
          xml.Product do
            xml.SuppliersProductCode o.id
            xml.Description "test"
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
            xml.Description "test"
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

