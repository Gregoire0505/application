class Publication < ApplicationRecord
  belongs_to :user
  belongs_to :town
  has_many :comments
  acts_as_votable

  has_attached_file :publication_img, styles: { publication_index: "300x300>", publication_show: "200x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :publication_img, content_type: /\Aimage\/.*\z/

  has_many :favorite_publications
  has_many :favorited_by, through: :favorite_publications, source: :user

end
