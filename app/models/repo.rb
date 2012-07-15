class Repo < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :url

  has_many :commits

  after_create :clone!

  github_concern :repo => :name

  def self.pull_all!
    all.each do |repo|
      repo.pull!
    end
  end

  def to_s
    name
  end

  def clone!
    grit = Grit::Git.new(Rails.root.join('tmp').to_s)
    grit.clone({:quiet => false, :verbose => true, :progress => true}, url, root.to_s)
  end
  
  def pull!
    # FIXME: WHY WON'T GRIT PULL WORK LIKE I WANT IT TO?????
    `cd #{root}; git pull`
  end

  def git_repo
    Grit::Repo.new(root.to_s)
  end

  def root
    Rails.root.join('repos', name)
  end
end
