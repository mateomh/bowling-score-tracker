#!/usr/bin/env ruby
require_relative './lib/line'
require_relative './lib/frame'

raise StandardError, 'No score line provided' if ARGV.length != 1

l = Line.new
l.parse_line(ARGV[0])
p "Your score is #{l.check_line_score}"
