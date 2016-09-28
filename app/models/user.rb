class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        
  extend FriendlyId
    friendly_id :username, use: :slugged

         
  has_many :artikel
  has_many :game
  has_many :game, :through => :own
  has_many :own
  has_many :wishlist
  has_many :game, :through => :wishlist
        
end
