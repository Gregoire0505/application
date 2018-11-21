class Publication < ApplicationRecord
  belongs_to :user
  has_one :town
  has_many :comments
end
