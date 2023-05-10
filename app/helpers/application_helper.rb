module ApplicationHelper
  def is_comment_owner?(comment)
    comment.user == current_user
  end
end
