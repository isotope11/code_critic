class Repo < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :url

  has_many :commits

  github_concern :repo => :name

  def to_s
    name
  end

  def clone!
    grit = Grit::Git.new(Rails.root.join('tmp').to_s)
    grit.clone({:quiet => false, :verbose => true, :progress => true}, url, root.to_s)
  end

  def git_repo
    Grit::Repo.new(root.to_s)
  end

  def root
    Rails.root.join('tmp', name)
  end
end
