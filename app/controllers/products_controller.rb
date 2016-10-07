
class ProductsController < ApplicationController
  def home
  end

  def collection
  end

  def apparel
    @products= Product.all
  end

  def view
    @product= Product.find_by id: params[:id]

  end

  def contact
  end

  def policies
  end

  def about
  end


end
