#!/usr/bin/env ruby
require_relative './lib/line'
require_relative './lib/frame'

l = Line.new
l.parse_line('5/5/5/5/5/5/5/5/5/5/5')
l.line.each do |f|
  p f.tries
end
p l.line.count
p l.check_line_score
