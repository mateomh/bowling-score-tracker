#!/usr/bin/env ruby
require_relative './lib/line'
require_relative './lib/frame'

line = Line.new
f1 = Frame.new
f1.try_score('X')
line.add_frame(f1)
puts line.line[0].tries
