class Line
  attr_reader :line

  def initialize
    @line = []
  end

  def add_frame(frame)
    @line.push(frame)
  end

  def check_line_score
  end
end