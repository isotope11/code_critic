require 'test_helper'

describe Repo do
  it "has the basics down" do
    Repo.must_be_kind_of Class

    repo = Repo.new
    repo.must have_valid(:name).when("code_critic")
    repo.wont have_valid(:name).when("")

    repo.must have_valid(:url).when("git@github.com:isotope11/code_critic.git")
    repo.wont have_valid(:url).when("")
  end
end
