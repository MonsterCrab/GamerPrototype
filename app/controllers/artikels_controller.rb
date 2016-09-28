class ArtikelsController < ApplicationController
    before_filter :authenticate_user!, except: [:index, :show]


	def index
		@artikels = Artikel.all.order("created_at DESC")
		@artikel_days = @artikels.group_by{|a| a.created_at.beginning_of_day}
		@games = Game.all.order("score DESC")
	end

	def new
		@artikel = current_user.artikel.build
	end

	def create
		@artikel = current_user.artikel.build(artikel_params)
		@artikel.user_id = current_user.id
		if @artikel.save
			redirect_to @artikel, notice: "Successfully added a artikel"
		else
			render 'new'
		end
	end

	def edit
		@artikel = Artikel.friendly.find(params[:id])
		@artikel.user_id = current_user.id
	end

	def update
		@artikel = Artikel.friendly.find(params[:id])
		if @artikel.update(artikel_params)
			redirect_to @artikel, notice: "artikel updated"
		else
			render 'edit'
		end
	end

	def show
		@artikel = Artikel.friendly.find(params[:id])
	end

	def destroy
		@artikel = Artikel.find(params[:id])
		@artikel.destroy
		redirect_to artikels_path
	end



	private
		def require_user
			@artikel = Artikel.find(params[:id])
		    unless current_user.id == @artikel.user_id
		    	redirect_to(request.referrer || root_path)
		    end
	  	end

		def find_post
			@artikel = Artikel.find(params[:id])
		end

		def set_post
      		@artikel = Artikel.find(params[:id])
    	end

		def artikel_params
			params.require(:artikel).permit(:title, :description, :subtitle, :tag, :platform, :slug)
		end
	
end
