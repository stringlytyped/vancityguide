class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable
  
  has_many :pois, foreign_key: "owner_id",
                  dependent: :destroy

  has_many :bookmarks, foreign_key: "owner_id",
                       dependent: :destroy
end
