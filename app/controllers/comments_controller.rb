class CommentsController < ApplicationController
  def index
    @event = Event.find(params[:id])
    @comments = Comment.where(event_id: params[:id])
  end

  def new
    @event = Event.find(params[:id])
  end

  def create
    @comment = Comment.new(event_id: params[:id], message: params[:message], user_id: current_user.id)
    if @comment.save
      redirect_to all_comments_path
    else
      redirect_to action: new, flash: { danger: 'Something went wrong here.' }
    end
  end
end
