class ProductsController < ApplicationController
  def show
  	@product=Product.find(params[:id])

  	@recent = Product.where(:delete_status => 'not deleted').last(4)
  end
end
