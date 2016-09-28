class GamesController < ApplicationController
     before_filter :authenticate_user!, except: [:index, :show]

    def search
    	if params[:search].present?
    		@games = Game.search(params[:search])
    	else
    		@games = Game.all
    	end    	
    end
	def index
		@games = Game.all
	end

	def new
		@game = current_user.game.build
	end

	def create
		@game = current_user.game.build(game_params)
		@game.user_id = current_user.id
		if @game.save
			redirect_to @game, notice: "Successfully added a game"
		else
			render 'new'
		end
	end

	def edit
		@game = Game.friendly.find(params[:id])
		@game.user_id = current_user.id
	end

	def update
		@game = Game.friendly.find(params[:id])
		if @game.update(game_params)
			redirect_to @game, notice: "game updated"
		else
			render 'edit'
		end
	end

	def show
		@game = Game.friendly.find(params[:id])
		
	end

	def destroy
		@game = Game.friendly.find(params[:id])
		@game.destroy
		redirect_to games_path
	end



	private
		def require_user
			@game = Game.find(params[:id])
		    unless current_user.id == @game.user_id
		    	redirect_to(request.referrer || root_path)
		    end
	  	end

		def find_post
			@game = Game.find(params[:id])
		end

		def set_post
      		@game = Game.find(params[:id])
    	end

		def game_params
			params.require(:game).permit(:title, :description, :subtitle, :tag, :platform, :slug, :score, :release_date, :urltitle, :urlurl, :image)
		end
	
end
