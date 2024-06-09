#!/usr/bin/env ruby

require 'date'
require 'optparse'

opt = OptionParser.new
opt.on('-m') 
opt.on('-y')
input_date = ARGV.getopts('m:', 'y:')
month = input_date['m'].to_i
year = input_date['y'].to_i
this_month = Date.today.month
this_year = Date.today.year

if month == 0 && year == 0
    month = this_month
    year = this_year
elsif year == 0
    year = this_year
end

first_day = Date.new(year, month)
last_day = Date.new(year, month, -1)
space = "   "

puts "#{space * 2} #{month}月 #{year}"
puts "日 月 火 水 木 金 土"

7.times do |i|
    if first_day.cwday == i
        print space * i
    end
end
# case
# when first_day.cwday == 1
#     print space
# when first_day.cwday == 2
#     print space * 2
# when first_day.cwday == 3
#     print space * 3
# when first_day.cwday == 4
#     print space * 4
# when first_day.cwday == 5
#     print space * 5
# when first_day.cwday == 6
#     print space * 6
# end
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
