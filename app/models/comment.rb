class Comment < ActiveRecord::Base
  after_create :update_review_request
  opinio

  fires :create

  def update_review_request
    ReviewRequest.find_all_by_user_id_and_commit_id(self.owner.id, self.commentable.id).map{|x| x.review_completed! unless x.state = 'review_completed'}
  end
end
