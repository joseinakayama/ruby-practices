#!/usr/bin/env ruby

require 'date'
require 'optparse'
opt = OptionParser.new

opt.on('-m') 
opt.on('-y')

input_date = ARGV.getopts('m:', 'y:')

input_date_month = input_date['m'].to_i
input_date_year = input_date['y'].to_i

this_month = Date.today.month
this_year = Date.today.year


if input_date_month == 0 && input_date_year == 0
    input_date_month = this_month
    input_date_year = this_year
elsif input_date_year == 0
    input_date_year = this_year
end


first_day = Date.new(input_date_year, input_date_month)
last_day = Date.new(input_date_year, input_date_month, -1)
space = "   "

puts "#{space * 2} #{input_date_month}月 #{input_date_year}"
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
