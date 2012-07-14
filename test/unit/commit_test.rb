require 'test_helper'

describe Commit do
  it "has the basics down" do
    Commit.must_be_kind_of Class

    commit = Commit.new
    commit.must have_valid(:sha).when("12345")
    commit.wont have_valid(:sha).when("")

    commit.must have_valid(:repo_id).when(1)
    commit.wont have_valid(:repo_id).when(nil)
  end

  it "uses its sha for to_s" do
    commit = Commit.new sha: 'foo'
    commit.to_s.must_equal 'foo'
  end
end
