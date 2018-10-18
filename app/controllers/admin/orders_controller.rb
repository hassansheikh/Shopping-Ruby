class Admin::OrdersController < ApplicationController

	layout 'admin'
	def index
		@orders=Cart.where(status: 'checkout')
	end

	def show
		@order_item=Cart.find(params[:id])
	end

	def edit
		@order=Cart.find(params[:id])
	end

	def update
		@order = Cart.find(params[:id])
 
		  if @order.update(params.require(:cart).permit(:status))
		    redirect_to admin_orders_path
		  end
	end
end
