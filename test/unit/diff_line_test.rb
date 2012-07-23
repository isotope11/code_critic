require 'test_helper'

describe DiffLine do
  before do
    @commit = 'asdf'
    @file_index = 0
    @line_index = 1
  end

  describe "A typical DiffLine" do
    subject { DiffLine.new('', @commit, @file_index, @line_index) }
    it "knows its file_index" do
      subject.file_index.must_equal 0
    end

    it "knows its commit" do
      subject.commit.must_equal 'asdf'
    end

    it "knows its line_index" do
      subject.line_index.must_equal 1
    end
  end

  it "responds to #added?" do
    string = "+h2 Review Requests"
    dl = DiffLine.new(string, @commit, @file_index, @line_index)
    dl.added?.must_equal true
  end

  it "responds to #removed?" do
    string = "-h2 Review Requests"
    dl = DiffLine.new(string, @commit, @file_index, @line_index)
    dl.removed?.must_equal true
  end

  it "responds to #added_or_removed" do
    string = "-h2 Review Requests"
    dl = DiffLine.new(string, @commit, @file_index, @line_index)
    dl.added_or_removed.must_equal 'removed'
  end

  it "replaces the proper characters in the line for html safety when using #to_s" do
    string = "   foo<span>bar</span>"
    dl = DiffLine.new(string, @commit, @file_index, @line_index)
    dl.to_s.must_equal '&nbsp;&nbsp;&nbsp;foo&lt;span&gt;bar&lt;/span&gt;'
  end
end
