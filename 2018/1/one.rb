#!/usr/bin/env ruby
p File.read('input').split("\n").map(&:to_i).reduce{ |sum, c| sum += c; sum }
