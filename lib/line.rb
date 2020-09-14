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
    total_score = 0 # initialize the total score
    (0...10).each do |index| # iterates through the 10 trhows that you get
      total_score += @line[index].frame_score # adds the frame score to the total score
      if @line[index].tries.length == 1 # if the throw was a strike it adds the next 2 throws
        total_score += @line[index + 1].frame_score
        total_score += @line[index + 2].frame_score
      elsif @line[index].tries.sum == 10 # if the throw was a spare it adds only the next pin score
        total_score += @line[index + 1].tries[0]
      end
    end
    total_score
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
    if try_count == 1
      f.try_score(0) 
      add_frame(f) # If the last shoot was spare generates another frame
    end
  end
end