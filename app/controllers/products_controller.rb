require 'csv'

class ProductsController < ApplicationController
  def home
  end

  def collection
  end

  def apparel
    @products= fetch_products
  end

  def view
    @products = fetch_products

    @product = @products.find {|a| a.pid == params[:pid]}
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
      product.xs = row.to_h["xs"]
      product.s = row.to_h["s"]
      product.m = row.to_h["m"]
      product.l = row.to_h["l"]
      product.xl = row.to_h["xl"]
      @products << product
  end
    @products
end

end
