class Wishlist < ActiveRecord::Base
	
	
	 belongs_to :user
    belongs_to :game

end
