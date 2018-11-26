class Comment < ApplicationRecord
acts_as_votable
  belongs_to :publication
  belongs_to :user

end
