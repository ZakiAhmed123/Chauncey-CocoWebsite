require 'csv'

class ProductsController < ApplicationController
  def home
  end

  def collection
  end

  def apparel
    @products= fetch_products
  end

  def apparel_view
    @products = fetch_products

    @product = @products.find {|a| a.pid == params[:pid]}
  end

  def gifts
  end

  def jewelry
    @jewelrys = fetch_jewelry
  end

  def jewelry_view
    @jewelrys = fetch_jewelry

    @jewelry = @jewelrys.find {|a| a.jid == params[:jid]}
  end

  def contact
  end

  def policies
  end

  def about
  end

  def fetch_products
    @products=[]
    CSV.foreach("cc_inventory.csv", headers:true) do |row|
      product=Product.new
      product.pid = row.to_h["pid"]
      product.item = row.to_h["item"]
      product.description = row.to_h["description"]
      product.price = row.to_h["price"]
      product.img_file = row.to_h["img_file"]
      product.category = row.to_h["category"]
      product.xs = row.to_h["xs"]
      product.s = row.to_h["s"]
      product.m = row.to_h["m"]
      product.l = row.to_h["l"]
      product.xl = row.to_h["xl"]
      @products << product
    end
    @products
end

def fetch_jewelry
  @jewelry =[]
  CSV.foreach("jewelry.csv", headers:true) do |row|
    jewelry=Product.new
    jewelry.jid = row.to_h["jid"]
    jewelry.item = row.to_h["item"]
    jewelry.description = row.to_h["description"]
    jewelry.price = row.to_h["price"]
    jewelry.size = row.to_h["size"]
    jewelry.img_file = row.to_h["img_file"]
    @jewelry << jewelry
end
@jewelry
end


end
