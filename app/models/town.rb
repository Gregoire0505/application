class Town < ApplicationRecord
  belongs_to :publication, required: false
  belongs_to :country, required: false

end
