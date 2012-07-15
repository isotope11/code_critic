class Activity < ActiveRecord::Base
  attr_accessible :activity_type, :target, :actor, :data
  belongs_to :target, :polymorphic => true
  belongs_to :actor, :polymorphic => true
  serialize :data
end
