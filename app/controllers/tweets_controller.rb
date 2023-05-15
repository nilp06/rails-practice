class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[edit update destroy]
  before_action :check_user, only: %i[edit update destroy]
  def index
    @tweets = current_user.tweets
  end

  def new
    @tweet = current_user.tweets.build
  end

  def create
    @tweet = current_user.tweets.create(tweet_params)

    if @tweet.save
      redirect_to action: :index
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @tweet.update(tweet_params)
      redirect_to action: :index
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tweet.destroy

    redirect_to action: :index
  end

  private

  def check_user
    return unless @tweet.user != current_user

    redirect_to root_path, flash: { danger: 'You have not access to these page.' }
  end

  def tweet_params
    params.require(:tweet).permit(:message)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
