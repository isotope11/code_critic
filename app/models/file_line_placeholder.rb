class FileLinePlaceholder < ActiveRecord::Base
  belongs_to :commit
  validates_presence_of :file_index
  validates_presence_of :line_index
  validates_uniqueness_of :line_index, scope: [:commit_id, :file_index]
  opinio_subjectum

  def self.find_or_create_for(diff_line)
    commit = Commit.where(sha: diff_line.commit).first
    find_or_create_by_commit_id_and_line_index_and_file_index(commit.id, diff_line.line_index, diff_line.file_index)
  end
end
