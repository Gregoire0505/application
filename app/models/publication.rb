class Publication < ApplicationRecord
  belongs_to :user,required: false
  belongs_to :town, required: false
  has_many :comments, required: false
end
