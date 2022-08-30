# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable

  alias :author :user

  validates :body, presence: true
  validates :title, presence: true
end
