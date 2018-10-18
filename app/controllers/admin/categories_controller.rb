module Admin

class CategoriesController < ApplicationController

	layout 'admin'
	def index
		@categories=Category.where(:delete_status => 'not deleted')
	end

	def new
		@category=Category.new
	end

	def create
		@category = Category.new(article_params)
 
		  if @category.save
		    redirect_to admin_categories_path
		  else
		    render 'new'
		  end
	end

	def show
		@category=Category.find(params[:id])
	end

	def edit
		@category=Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
 
		  if @category.update(params.require(:category).permit(:title,:status))
		    redirect_to admin_categories_path
		  else
		    render 'edit'
		  end
	end

	def destroy
		@category=Category.find(params[:id])
		@category.update_columns(delete_status: "Deleted")
		redirect_to admin_categories_path
	end

	def article_params
	    params.require(:category).permit(:title)
	end

end
end
