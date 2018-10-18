class ProductsController < ApplicationController
  def show
  	@product=Product.find(params[:id])

  	@recent = Product.last(4)
  end
end
