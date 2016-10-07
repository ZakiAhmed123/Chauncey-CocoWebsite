class GiftsController < ApplicationController

  def index
    @gifts=Product.all
  end

  def view
    @gift=Product.find_by id: params[:id]
  end

end
