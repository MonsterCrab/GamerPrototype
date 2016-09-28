class UserController < ApplicationController
  
    
    def show
        
        @user = User.friendly.find(params[:id])
     	@own = @user.own
        @wislist = @user.wishlist
    end
    
    private
    
    def user_params
			params.require(:user).permit(:name, :slug)
	end
	
	
end
