require 'test_helper'

describe ReviewRequest do
  it "has the basics down" do
    ReviewRequest.must_be_kind_of Class

    review_request = ReviewRequest.new
    review_request.must have_valid(:commit_id).when(1)
    review_request.wont have_valid(:commit_id).when(nil)

    review_request.must have_valid(:user_id).when(1)
    review_request.wont have_valid(:user_id).when(nil)
  end

end
