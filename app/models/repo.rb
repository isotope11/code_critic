class Repo < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :url

  has_many :commits

  after_create :clone

  github_concern :repo => :name

  def self.pull_all!
    all.each do |repo|
      repo.pull
    end
  end

  def to_s
    name
  end

  def clone
    RepoCloneWorker.perform_async(id)
  end

  def clone!
    grit = Grit::Git.new(Rails.root.join('tmp').to_s)
    grit.clone({:quiet => false, :verbose => true, :progress => true, :timeout => false}, url, root.to_s)
  end

  def pull!
    # FIXME: WHY WON'T GRIT PULL WORK LIKE I WANT IT TO?????
    `cd #{root}; git pull`
    git_repo.remotes.each do |remote|
      local_name = remote.name.split('/').last
      `cd #{root}; git checkout #{local_name}; git merge #{remote.name}`
    end
  end

  def pull
    RepoPullWorker.perform_async(id)
  end

  def git_repo
    Grit::Repo.new(root.to_s)
  end

  def root
    File.join(Repo.local_clones_parent_dir, name)
  end

  def self.local_clones_parent_dir
    ENV['CODE_CRITIC_LOCAL_CLONES_DIR'] || Rails.root.join('repos')
  end
end
