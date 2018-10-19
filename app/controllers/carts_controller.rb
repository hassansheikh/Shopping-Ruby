class CartsController < ApplicationController

skip_before_action :verify_authenticity_token
	def index
		
		if (current_user)
			@user=User.find(current_user.id)
			@cart=@user.carts.where(status: 'cart').last
			if(@cart)
				@cartitems=@cart.cartitems
			end
		else
			redirect_to new_user_session_path
		end
	end

	def new
	end

	def create
		@user=current_user
		@cart=Cart.where(user_id: current_user.id , status: 'cart')
		count=@cart.count
		if count==1
			@cart.each do |ca|
				@cartitem=Cartitem.new
				@cartitem.Product_id=params[:id]
				@cartitem.Cart_id=ca.id
				@cartitem.save
			end

		else
			@newcart=Cart.new
			@newcart.user_id=@user.id
			@newcart.save
			@cartitem=Cartitem.new
			@cartitem.Product_id=params[:id]
			@cartitem.Cart_id=@newcart.id
			@cartitem.save
		end

		#@user=current_user
		#@cart=Cart.new
		#@cart.user_id=@user.id
		#@cart.product_id=params[:id]
		#@cart.save
	end

	def edit
		@cart=Cart.find(1)
	end

	def update
		@cart= params.require(:cart).permit(:name,:number,:address)
		@user=User.find(current_user.id)
		@cart_items=@user.carts
		Cart.where(user_id: current_user.id , status: 'cart').update_all(number: @cart[:number], name: @cart[:name], address: @cart[:address], status: 'checkout' )
		redirect_to home_index_path
	end

	def destroy
		@cart=Cart.find(params[:id])
		@cart.destroy
	end
end
