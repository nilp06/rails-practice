module PostsHelper
  def post_comment_object(post)
    post.comments.build
  end

  def post_likes_count(post)
    post.likes.count
  end

  def user_liked_post?(post)
    current_user.likes.where(post_id: post.id).present?
  end

  def is_owner?(post)
    post.user == current_user
  end

  def like_dislikes_paths(post)
    !user_liked_post?(post) ? like_post_path(post) : dislike_post_path(post)
  end

  def like_dislikes_button_text(post)
    !user_liked_post?(post) ? "Like" : "Dislike"
  end

end
