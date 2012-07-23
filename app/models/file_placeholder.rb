class FilePlaceholder < ActiveRecord::Base
  belongs_to :commit
  validates_presence_of :file_index
  validates_uniqueness_of :file_index, scope: :commit_id
  opinio_subjectum

  def self.find_or_create_for(diff_file)
    commit = Commit.where(sha: diff_file.commit).first
    find_or_create_by_commit_id_and_file_index(commit.id, diff_file.file_index)
  end
end
