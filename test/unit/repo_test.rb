require 'test_helper'

describe Repo do
  it "has the basics down" do
    Repo.must_be_kind_of Class

    repo = Repo.new url: 'bar'
    repo.name = 'code_critic'
    repo.valid?.must_equal true
    repo.name = ''
    repo.valid?.wont_equal true

    repo.name = 'bar'
    repo.url = 'git@github.com:isotope11/code_critic.git'
    repo.valid?.must_equal true
    repo.url = ''
    repo.valid?.wont_equal true
  end

  it "uses its name for to_s" do
    repo = Repo.new name: 'foo'
    repo.to_s.must_equal 'foo'
  end
end
