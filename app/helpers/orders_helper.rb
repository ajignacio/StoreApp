module OrdersHelper
  
  #def prod_code(p)
  #  p.product.code
  #end
  #
  #def prod_name(p)
  #  p.product.name
  #end
  #
  #def prod_price   (p) 
  #  number_to_currency(p.product.price,:unit=>'€')
  #end
  #
  #def prod_qty(p)
  #  p.qty
  #end
  #
  #def prod_vat(p)
  #  "#{p.product.vat.name}(#{p.product.vat.percent}%)"
  #end
  #
  #def sub_total(p)    
  #  number_to_currency(p.total,:unit=>'€')
  #end
  #
  #def sub_total_price(p)
  #  subtotal(p.total)
  #  p.total
  #end
  #
  #def subtotal(total)
  #  number_to_currency(total,:unit=>'€')
  #end
  
  def discount(total)
    if total >= 70    
      (total * 12 / 100)
    else
      0
    end
  end
  
  def total_order(total)
    if total >= 70    
      total - (total * 12 / 100) 
    else
      total
    end
  end
  
end