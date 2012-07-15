class DiffFile
  attr_accessor :file, :git_diff

  def initialize(git_diff)
    @git_diff = git_diff
    @file = git_diff.diff
  end

  def each_line &block
    @file.each_line do |l|
      block.call DiffLine.new(l)
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
end
