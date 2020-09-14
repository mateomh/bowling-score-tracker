#!/usr/bin/env ruby
require_relative './lib/line'
require_relative './lib/frame'

line = Line.new
# f1 = Frame.new
# f1.try_score('X')
# line.add_frame(f1)
line.parse_line('9-9-9-9-9-9-9-9-9-9-')
line.line.each do |f|
  p f.tries
end
p line.line.count
