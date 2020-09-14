#!/usr/bin/env ruby
require_relative './lib/line'
require_relative './lib/frame'

raise StandardError, 'No score line provided' if ARGV.length != 1

l = Line.new
l.parse_line(ARGV[0])
l.line.each do |f|
  p f.tries
end
p l.line.count
p l.check_line_score
