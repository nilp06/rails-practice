class CommentsController < ApplicationController
  before_action :set_post

  def index; end

  def show; end

  def create
    @comment = @post.comments.create(message: params[:comment][:message], user_id: current_user.id)
    flash[:message] = 'Something went wrong.' unless @comment.save
    redirect_back fallback_location: root_path
  end

  def show; end

  def edit; end

  def destroy; end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:message)
  end
end
