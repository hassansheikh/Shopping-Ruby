class Admin::ProductsController < ApplicationController


	layout 'admin'
	def index
		@products=Product.where(:delete_status => 'not deleted')
	end

	def new
		@product=Product.new
	end

	def create
		cat_id=params.require(:product).permit(:cat_id)
		last_product=Product.where(:category_id => cat_id[:cat_id]).order("created_at").last
		if (last_product)
			last_product_code= last_product.product_code
			last_product_code.slice!(0,3)
			num= last_product_code.to_i+1
		else
			num=1
		end
		cat_name=params.require(:product).permit(:cat_name)
		product_code=cat_name[:cat_name]+"-00"+num.to_s

		

		@product = Product.new(article_params)
		@product.product_code=product_code
 
		  if @product.save
		    redirect_to admin_products_path
		  else
		    render 'new'
		  end
	end

	def show
		@product=Product.find(params[:id])
	end

	def edit
		@product=Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
 
		  if @product.update(params.require(:product).permit(:name,:price,:category_id,:description,:status,images: []))
		    redirect_to admin_products_path
		  else
		    render 'edit'
		  end
	end

	def destroy
		@product=Product.find(params[:id])
		@product.update_columns(delete_status: "Deleted")
		redirect_to admin_products_path
	end

	def article_params
	    params.require(:product).permit(:name,:price,:category_id,:description,images: [])
	end

	def delete_image_attachment
  		@image = ActiveStorage::Attachment.find(params[:id])
  		@image.purge
  		respond_to do |format|
			format.js
			format.html
		end
	end

end
