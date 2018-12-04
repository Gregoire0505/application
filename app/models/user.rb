class User < ApplicationRecord
acts_as_voter
  has_many :publications
  has_many :comments

  has_many :favorite_publications
  has_many :favorites, through: :favorite_publications, source: :publication

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
