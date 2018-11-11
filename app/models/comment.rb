class Comment < ApplicationRecord
  belongs_to :publication, required: false
  belongs_to :user, required: false
end
