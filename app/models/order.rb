class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def subtotal
  order_items.map { |order_item| order_item.item_price}.sum
end
def total_shipping
    order_items.map{ |order_item| order_item.item_shipping_price }.sum
  end

  def total_price
    order_items.map { |order_item| order_item.tax_price}.sum
  end

  def final_price
    (total_price * 100).to_i
end

def total_tax
    order_items.map { |order_item| order_item.item_tax }.sum
  end

  def total_price_in_cents
    (total_price * 100).to_i
  end

  def cart_total
  subtotal + total_shipping
end

end
