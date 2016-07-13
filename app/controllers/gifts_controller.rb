require 'csv'
class GiftsController < ApplicationController

  def index
    @gifts = fetch_gifts
  end

  def view
    @gifts = fetch_gifts

    @gift = @gifts.find {|a| a.gid == params[:gid]}
  end

  def fetch_gifts
    @gifts=[]
    CSV.foreach("gifts_inventory.csv", headers:true) do |row|
      gift=Gift.new
      gift.gid = row.to_h["gid"]
      gift.item = row.to_h["item"]
      gift.description = row.to_h["description"]
      gift.price = row.to_h["price"]
      gift.img_file = row.to_h["img_file"]
      gift.bullet_1 = row.to_h["bullet_1"]
      gift.bullet_2 = row.to_h["bullet_2"]
      gift.bullet_3 = row.to_h["bullet_3"]
      gift.bullet_4 = row.to_h["bullet_4"]
      @gifts << gift
  end
  @gifts
  end

end
