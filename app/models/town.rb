class Town < ApplicationRecord
  has_many :publications
  belongs_to :country, required: false

end
