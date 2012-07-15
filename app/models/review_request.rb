class ReviewRequest < ActiveRecord::Base
  belongs_to :reviewable, :polymorphic => true
  belongs_to :user
  belongs_to :commit
end
