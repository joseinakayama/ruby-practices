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

if month.zero? && year.zero?
  month = this_month
  year = this_year
elsif year.zero?
  year = this_year
end

first_day = Date.new(year, month)
last_day = Date.new(year, month, -1)
space = '   '

puts "#{space * 2} #{month}月 #{year}"
puts '日 月 火 水 木 金 土'

print space * first_day.cwday

(first_day..last_day).each {|d|
  printf("%2d ", "#{d.day}")
  print "\n" if d.saturday?
}
