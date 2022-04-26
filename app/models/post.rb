class Post < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :user_votes, through: :votes, source: :user

  belongs_to :user
end
