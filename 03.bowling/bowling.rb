#!/usr/bin/env ruby

require 'debug'

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
    if s == 'X'
        shots << 10
        shots << 0
    else
        shots << s.to_i
    end
end

frames = []
shots.each_slice(2) do |s|
    frames << s
end
point = 0
frames.each_with_index do |frame, i|
    binding.break
    if i < 9
        if frame.first == 10
            point += frame.sum + frames[i+1].sum
        elsif frame.sum == 10
            point += frame.sum + frames[i+1][0]
        else
            point += frame.sum
        end
    else
        point += frame.sum
    end
end
puts point