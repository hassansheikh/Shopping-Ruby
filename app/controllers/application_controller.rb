class ApplicationController < ActionController::Base
	
	before_action :get_categories
	def get_categories
	    @categories = Category.all
	    @app_products=Product.where(:delete_status => 'not deleted',:status => 'active').first(4)

	    if (current_user)
			@user=User.find(current_user.id)
			@cart=@user.carts.where(status: 'cart').last
			if(@cart)
				@app_cartitems=@cart.cartitems
			end
		end
	end

end
