# A DiffFile represents a given file in a git diff
#
# The commit represents the commit this file came from
# The file_index is the index of this file in that commit's file list
class DiffFile
  attr_accessor :file, :git_diff, :commit, :file_index

  def initialize(git_diff, commit, file_index)
    @commit = commit
    @file_index = file_index
    @git_diff = git_diff
    @file = git_diff.diff
  end

  def each_line &block
    # linenumbering is lame here, but meh it works
    # I start out with -2 because the first three lines are the a and b line, and the position line, and they aren't really part of the file
    line_index = -3
    @file.each_line do |l|
      block.call DiffLine.new(l, commit, file_index, line_index)
      line_index += 1
    end
  end

  def file_path
    b_line[5..-1]
  end

  def a_line
    lines[0]
  end

  def b_line
    lines[1]
  end

  def lines
    @file.split("\n")
  end

  def file_placeholder
    FilePlaceholder.find_or_create_for(self)
  end
end
