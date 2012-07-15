class Commit < ActiveRecord::Base
  belongs_to :repo
  has_many :review_requests, :as => :reviewable
  validates_presence_of :sha, :repo_id
  validates_uniqueness_of :sha
  opinio_subjectum

  delegate :author, :message, to: :git_commit

  def self.load_from_git_commit(repo, sha)
    git_commit = repo.git_repo.commit(sha)
    if(git_commit)
      find_or_create_by_repo_id_and_sha(repo.id, sha)
    end
  end

  def to_s
    sha
  end

  def git_commit
    repo.git_repo.commit(sha)
  end

  def gravatar
    hash = Digest::MD5.hexdigest(git_commit.author.email.downcase)
    image_src = "http://www.gravatar.com/avatar/#{hash}"
  end

  def to_param
    sha
  end
end
