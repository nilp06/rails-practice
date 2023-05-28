class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy like dislike]

  def index
    @posts = Post.includes(:likes, :comments)
  end

  def like
    @post.likes.create!(user_id: current_user.id)
    redirect_to action: :index
  end

  def dislike
    @post.likes.find_by(user_id: current_user.id).destroy
    redirect_to action: :index
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.create(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new, status: unprocessable_entity
    end
  end

  def show
    @comments = @post.comments.includes(:user)
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
