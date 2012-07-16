# Pulls a repo given its id
class RepoPullWorker
  include Sidekiq::Worker

  def perform repo_id
    repo = Repo.find repo_id
    repo.pull!
  end
end
