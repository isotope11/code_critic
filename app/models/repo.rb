class Repo < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :url

  github_concern :repo => :name

  def to_s
    name
  end
end
