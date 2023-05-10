module PostsHelper
  def get_comment_object(post)
    post.comments.build
  end

  def get_likes(post)
    post.likes.count
  end

  def user_liked_post?(post)
    Like.where(user_id: current_user.id, post_id: post.id).present?
  end

  def is_owner?(post)
    post.user == current_user
  end
end
