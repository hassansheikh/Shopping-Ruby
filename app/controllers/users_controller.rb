class UsersController < ApplicationController

layout 'admin'
	def index
		@users=User.all
	end

	def edit
		@user=User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
 
		  if @user.update(params.require(:user).permit(:email,:role))
		    redirect_to users_path
		  else
		    render 'edit'
		  end
	end

	def destroy
		@user=User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end
end
