class WishlistController < ApplicationController

	 def create
	
	    @wishlist = current_user.wishlist.build(:game_id => params[:game_id])
	    if @wishlist.save
	      redirect_to user_path(current_user)
	    else
	      redirect_to root_path
	    end
	end

    def destroy
	    @wishlist = current_user.wishlist.find(params[:id])
	    @wishlist.destroy
	    redirect_to user_path
	end

end
