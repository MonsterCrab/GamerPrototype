class Game < ActiveRecord::Base
    searchkick callbacks: :async
    belongs_to :user
    
    has_many :user, :through => :own
    has_many :own, :foreign_key => :game_id
    has_many :user, :through => :wishlist
    has_many :wishlist, :foreign_key => :game_id
    
    extend FriendlyId
    friendly_id :title, use: :slugged
    
   
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    
end
