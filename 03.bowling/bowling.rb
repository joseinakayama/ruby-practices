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

frames = shots.each_slice(2).map {|item| item}

point = 0
frames.each_with_index do |frame, i|
  point += frame.sum
  next if i >= 9 || frame.sum != 10
  point += if frame.first == 10
            if frames[i + 1].first == 10
              frames[i + 1].first + frames[i + 2].first
            else
              frames[i + 1].sum
            end
          else
            frames[i + 1][0]
          end
end
puts point
