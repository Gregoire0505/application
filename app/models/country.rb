class Country < ApplicationRecord
  has_many :towns, required: false
end
