#!/usr/bin/env ruby

require 'date'
require 'optparse'
opt = OptionParser.new

opt.on('-m') 
opt.on('-y')

opt.parse!(ARGV)
input_date = ARGV
input_date.map!(&:to_i)

this_year = Date.today.year


if input_date.size == 1
    input_date << this_year
end


first_day = Date.new(input_date[1], input_date[0])
last_day = Date.new(input_date[1], input_date[0], -1)
space = "   "

puts "#{space * 2} #{input_date[0]}月 #{input_date[1]}"
puts "日 月 火 水 木 金 土"
case
when first_day.cwday == 1
    print space
when first_day.cwday == 2
    print space * 2
when first_day.cwday == 3
    print space * 3
when first_day.cwday == 4
    print space * 4
when first_day.cwday == 5
    print space * 5
when first_day.cwday == 6
    print space * 6
end
(first_day..last_day).each {|d|
    if d.saturday?
        if d.day <= 9
            puts " #{d.day}"
        else
            puts "#{d.day}"
        end
    else
        if d.day <= 9
            print " #{d.day} "
        else
            print "#{d.day} "
        end
    end
}