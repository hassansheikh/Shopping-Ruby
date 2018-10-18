class HomeController < ApplicationController
  def index
  	@categories=Category.all
  	@products=Product.where(:delete_status => 'not deleted',:status => 'active')
  	@products_all=Product.where(:delete_status => 'not deleted',:status => 'in active')
  end
end
