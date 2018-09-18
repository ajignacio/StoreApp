class Basket < ApplicationRecord
  
  belongs_to :product
  
  def self.build_order(item)
    b = find_by_user_cookie_and_product_id_and_status(item["user_uniq"],item["prod"],"order") || new()
    b.scan(item)
  end
  
  def scan(i)
    self.product_id = i["prod"]
    self.user_cookie = i["user_uniq"]
    self.qty = self.id.present? ? (self.qty + i["qty"].to_i) : i["qty"].to_i
    self.save
  end
  
  def total
    if self.product.code == "01"
      _price = self.qty * self.product.price.to_f  
      # count second flag
      _count = (self.qty / 2) * 5
      _price - _count
    else
      _price = self.qty * self.product.price.to_f
      _vat_price = _price * (self.product.vat.percent.to_f / 100)
      _price + _vat_price
        
    end
  end
  
  def self.update_order(item)
    _basket_data = {}
    _basket = find(item["basket"]) 
    _basket.qty = item["qty"]
    _basket.save(validate: false)
    _basket_data["sub_total_format"] = number_to_currency(_basket.total,:unit=>'€')
    _basket_data["sub_total"] = _basket.total
    _basket_data
  end
  
  def discount
    
  end
  
end
