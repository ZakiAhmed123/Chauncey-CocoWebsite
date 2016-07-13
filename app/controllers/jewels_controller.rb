require 'csv'

class JewelsController < ApplicationController

  def index
    @jewels = fetch_jewelry
  end

  def view
    @jewels = fetch_jewelry

    @jewel = @jewels.find {|a| a.jid == params[:jid]}
  end

  def fetch_jewelry
    @jewels =[]
    CSV.foreach("jewelry_inventory.csv", headers:true) do |row|
      jewel=Jewel.new
      jewel.jid = row.to_h["jid"]
      jewel.item = row.to_h["item"]
      jewel.description = row.to_h["description"]
      jewel.price = row.to_h["price"]
      jewel.img_file = row.to_h["img_file"]
      jewel.bullet_1 = row.to_h["bullet_1"]
      jewel.bullet_2 = row.to_h["bullet_2"]
      jewel.bullet_3 = row.to_h["bullet_3"]
      jewel.bullet_4 = row.to_h["bullet_4"]
      @jewels << jewel
  end
  @jewels
  end

end
