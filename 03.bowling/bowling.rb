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

frames = []
shots.each_slice(2) do |s|
  frames << s
end

point = 0
frames.each_with_index do |frame, i|
  if i < 9
    if frame.first == 10
      point += if frames[i + 1].first == 10
                frame.sum + frames[i + 1].first + frames[i + 2].first
              else
                frame.sum + frames[i + 1].sum
              end
    elsif frame.sum == 10
      point += frame.sum + frames[i + 1][0]
    else
      point += frame.sum
    end
  else
    point += frame.sum
  end
end
puts point
