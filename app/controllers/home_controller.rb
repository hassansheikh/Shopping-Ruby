class HomeController < ApplicationController
  def index
  	@categories=Category.all
  	@products=Product.where(:delete_status => 'not deleted',:status => 'active').first(4)
  	@products_all=Product.where(:delete_status => 'not deleted',:status => 'active').last(4)

  	if (current_user)
		@user=User.find(current_user.id)
		@cart=@user.carts.where(status: 'cart').last
		if(@cart)
			@cartitems=@cart.cartitems
		end
	end
  end
end
