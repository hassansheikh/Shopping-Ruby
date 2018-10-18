class HomeController < ApplicationController
  def index
  	@categories=Category.all
  	@products=Product.where(:delete_status => 'not deleted',:status => 'active').first(4)
  	@products_all=Product.where(:delete_status => 'not deleted',:status => 'active').last(4)
  end
end
