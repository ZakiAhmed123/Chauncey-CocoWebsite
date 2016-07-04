class Product < ActiveRecord::Base
  attr_accessor :pid,:jid,:item,:description,:price,:img_file,:category,:xs,:s,:m,:l,:xl, :size
end
