class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :likes, dependent: :destroy
  after_save :increment_comment_counter

  private

  def increment_comment_counter
    event = Event.find(event_id)
    event.increment!(:comment_count)
  end
end
