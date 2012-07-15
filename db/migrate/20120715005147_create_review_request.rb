class CreateReviewRequest < ActiveRecord::Migration
  def change
    create_table :review_requests do |t|
      t.integer  :reviewable_id
      t.string   :reviewable_type
      t.string   :commit_id
      t.integer  :user_id

      t.timestamps
    end
  end
end
