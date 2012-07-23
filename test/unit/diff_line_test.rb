require 'test_helper'

describe DiffLine do
  it "responds to #added?" do
    string = "+h2 Review Requests"
    dl = DiffLine.new(string)
    dl.added?.must_equal true
  end

  it "responds to #removed?" do
    string = "-h2 Review Requests"
    dl = DiffLine.new(string)
    dl.removed?.must_equal true
  end

  it "responds to #added_or_removed" do
    string = "-h2 Review Requests"
    dl = DiffLine.new(string)
    dl.added_or_removed.must_equal 'removed'
  end

  it "replaces the proper characters in the line for html safety when using #to_s" do
    string = "   foo"
    dl = DiffLine.new(string)
    dl.to_s.must_equal '&nbsp;&nbsp;&nbsp;foo'
  end
end
