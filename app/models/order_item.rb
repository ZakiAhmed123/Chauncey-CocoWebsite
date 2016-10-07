class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def item_price
  quantity * price
end

def item_shipping_price
  shipping_cost * quantity
end

def tax_price
  ((quantity * price) * 1.0825) + shipping_cost
end

def item_tax
  ((quantity * price) * 0.0825)
end

end
