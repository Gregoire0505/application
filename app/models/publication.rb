class Publication < ApplicationRecord
  belongs_to :user
  has_one :town
  has_many :comments

  has_attached_file :publication_img, styles: { publication_index: "300x300>", publication_show: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :publication_img, content_type: /\Aimage\/.*\z/
end
