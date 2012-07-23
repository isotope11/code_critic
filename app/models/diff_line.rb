class DiffLine
  attr_accessor :line, :commit, :file_index, :line_index

  delegate :start_with?, :to => :line

  def initialize(string, commit, file_index, line_index)
    @line = string
    @commit = commit
    @file_index = file_index
    @line_index = line_index
  end

  def added?
    start_with? '+'
  end

  def removed?
    start_with? '-'
  end

  def added_or_removed
    return 'added'   if added?
    return 'removed' if removed?
    return ''
  end

  def to_s
    @line.to_s.gsub(/ /, '&nbsp;')
  end

  def line_placeholder
    FileLinePlaceholder.find_or_create_for(self)
  end
end
