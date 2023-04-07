class LikesController < ApplicationController
  def index
    @comment = Comment.find(params[:id])
    @likes = Like.where(comment_id: params[:id])
  end

  def add
    @comment = Comment.find(params[:id])
    @like = Like.new(user_id: current_user.id, comment_id: params[:id])
    if !@like.present? && @like.save
      flash[:success] = 'You liked the comment.'
    else
      flash[:danger] = 'You already liked the comment.'
    end
    redirect_to all_likes_path(@comment)
  end
end
