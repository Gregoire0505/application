class Town < ApplicationRecord
  belongs_to :publication
  belongs_to :country

end
