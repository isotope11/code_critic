class DiffLine
  attr_accessor :line

  def initialize(string)
    @line = string
  end

  def added?
    first_char_is? '+'
  end

  def removed?
    first_char_is? '-'
  end

  def added_or_removed
    return 'added'   if added?
    return 'removed' if removed?
    return ''
  end

  def to_s
    @line.gsub(/ /, '&nbsp;')
  end

  private
  def first_char_is?(c)
    first_char == c
  end

  def first_char
    line[0]
  end
end
