class UpdateStatusToStateOnReviewRequests < ActiveRecord::Migration
  def change
    #remove_column :review_requests, :status
    add_column :review_requests, :state, :string, :default => 'review_created'
  end
end
