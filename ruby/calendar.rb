# frozen_string_literal: true

require 'date'
require 'optparse'

# 引数mを処理
def parsed_option
  option = ARGV.getopts('m:')['m']&.to_i

  return nil unless option
  return option if option && (1..12).include?(option)

  puts "#{option} is neigher a month number (1..12) nor a name"
  exit
end

# カレンダーの見出しを表示
def output_calender_header(first_date)
  puts "#{first_date.strftime('%B %Y').center(21)} "
  puts 'Mo Tu We Th Fr Sa Su '
end

# カレンダーの最初の週の空白の個数
def first_week_space_count(first_date)
  first_date.wday.zero? ? 6 : first_date.wday - 1
end

# カレンダーの日付を表示
def output_days(first_date, last_date)
  # 最初の週の空白を表示
  print ' '.rjust(3) * first_week_space_count(first_date)

  # 初日から最終日までを表示
  (first_date..last_date).each do |date|
    print "#{date.day.to_s.rjust(2)} "
    # 日曜日の場合改行
    print "\n" if date.sunday?
  end
end

# カレンダーの出力
def print_calendar
  first_date = Date.new(Date.today.year, parsed_option || Date.today.month, 1)
  last_date = first_date.next_month.prev_day

  output_calender_header(first_date)
  output_days(first_date, last_date)
end

print_calendar
