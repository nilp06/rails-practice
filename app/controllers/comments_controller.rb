class CommentsController < ApplicationController
  before_action :set_post, only: %i[new create]

  def index; end

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to new_post_comments_path
    end
  end

  def edit; end

  def destroy; end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:message)
  end
end
