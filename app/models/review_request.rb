class ReviewRequest < ActiveRecord::Base
  belongs_to :reviewable, :polymorphic => true
  belongs_to :user
  belongs_to :commit

  validates_presence_of :user_id
  validates_presence_of :commit_id

  fires :create

  scope :not_complete, where(:state => 'review_created')

  state_machine :state, :initial => :review_created do

    event :review_completed do
      transition :review_created => :review_completed
    end

    state :review_created
    state :review_completed
  end
end
