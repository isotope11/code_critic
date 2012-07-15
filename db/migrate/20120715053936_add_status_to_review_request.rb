class AddStatusToReviewRequest < ActiveRecord::Migration
  def change
    add_column :review_requests, :status, :boolean
  end
end
