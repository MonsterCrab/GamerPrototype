class OwnsController < ApplicationController
    def create
	
	    @own = current_user.owns.build(:game_id => params[:game_id])
	    if @own.save
	      redirect_to user_path(current_user)
	    else
	      redirect_to root_path
	    end
	end

    def destroy
	    @own = current_user.owns.find(params[:id])
	    @own.destroy
	    redirect_to user_path
	end


	
end
