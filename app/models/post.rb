class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  alias :author :user
end
