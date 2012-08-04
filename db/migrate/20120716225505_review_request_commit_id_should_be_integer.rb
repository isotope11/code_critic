class ReviewRequestCommitIdShouldBeInteger < ActiveRecord::Migration
  def change
    remove_column :review_requests, :commit_id
    add_column :review_requests, :commit_id, :integer
  end
end
