# Clones a repo after it is created
class RepoCloneWorker
  include Sidekiq::Worker

  def perform repo_id
    repo = Repo.find repo_id
    repo.clone!
  end
end
