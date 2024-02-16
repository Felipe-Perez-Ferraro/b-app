class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :likes_counter

  private

  def likes_counter
    post.update(likes_counter: post.likes.count)
  end
end