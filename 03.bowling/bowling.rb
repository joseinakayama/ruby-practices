#!/usr/bin/env ruby

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

frames = shots.each_slice(2).to_a

point = 0
frames.each_with_index do |frame, i|
  point += frame.sum
  next if i >= 9 || frame.sum != 10
  point += frames[i + 1].first
  next if frame.first != 10
  point += if frames[i + 1].first == 10
              frames[i + 2].first
            else
              frames[i + 1].last
            end
end
puts point
