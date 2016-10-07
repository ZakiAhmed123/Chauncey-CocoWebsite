class JewelsController < ApplicationController

  def index
    @jewels = Product.all
  end

  def view
    @jewel=Product.find_by id: params[:id]
  end


end
