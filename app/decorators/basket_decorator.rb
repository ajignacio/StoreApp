class BasketDecorator < Draper::Decorator
  delegate_all
  
  def prod_code
    object.product.code
  end
  
  def prod_name
    object.product.name
  end
  
  def prod_price    
    number_to_currency(object.product.price,:unit=>'€')
  end
  
  def prod_qty
    object.qty
  end
  
  def prod_vat
    "#{object.product.vat.name}(#{object.product.vat.percent}%)"
  end
  
  def sub_total    
    number_to_currency(object.total,:unit=>'€')
  end
  
  def sub_total_price
    object.total
  end


end
