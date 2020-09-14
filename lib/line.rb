require_relative 'frame'

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

  def parse_line(full_line)
    try_count = 0 # counter for the tries
    full_line = full_line.downcase # ensure all the characters are down case
    f = nil # Initialize the frame so it doesn't gets erased in each iteration
    full_line.each_char do |try| # goes through the line to parse it
      f = Frame.new if try_count == 0 # creates a new frame object for each new frame
      case try # Checks for the type of frame
      when 'x'
        f.try_score(10) # add a score of 10 to the frame
        try_count = 2 # moves to the next frame
      when '/'
        f.try_score(10 - f.tries[0])
        try_count = 2
      else
        f.try_score(try.to_i) # gets the score into the frame
        try_count += 1 # counts the try
      end

      if try_count == 2 # checks if the frame is done all the tries
        try_count = 0
        add_frame(f) # adds the frame to the line object
      end
    end
    add_frame(f) if try_count == 1 # If the last shoot was spare generates another frame
  end
end