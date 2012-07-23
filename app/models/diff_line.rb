class DiffLine
  attr_accessor :line

  delegate :start_with?, :to => :line

  def initialize(string)
    @line = string
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
end
