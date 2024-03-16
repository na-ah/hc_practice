# frozen_string_literal: true

# -m引数で月が指定できる
# -m引数が不正な場合はエラーを出す
# 引数を指定しない場合は、今月、今年のカレンダーを表示

require 'date'
# 0-6の曜日を返す。日曜日が0。
base_date = Date.new(Date.today.year, Date.today.month, Date.today.day)
first_day = Date.new(base_date.year, base_date.month, 1)
last_day = Date.new(base_date.year, base_date.month, -1)
month_days = (first_day..last_day)

# 曜日、各日の出力幅を指定
def day_format(day)
  day.rjust(3)
end

# 初週の空白を出力
def output_first_week_spaces(first_day)
  if first_day.wday.zero?
    print day_format(' ') * 6
  else
    print day_format(' ') * (first_day.wday - 1)
  end
end

# 月の各日を出力
def output_days(month_days)
  month_days.each do |day|
    # wdayが0(日曜)の時は、改行する
    if day.wday.zero?
      print "#{day_format(day.day.to_s)}\n"
    else
      print day_format(day.day.to_s)
    end
  end
end

# カレンダーの上部を出力
def output_calender_top(base_date)
  calendar_title = "#{base_date.year} #{base_date.strftime('%B')}"
  calendar_weekday = %w[Mo Tu We Th Fr Sa Su].map { |wday| day_format(wday) }.join
  print "#{calendar_title.center(20)} \n"
  print "#{calendar_weekday} \n"
end

# カレンダー全体を出力
def output_calendar(base_date, month_days)
  output_calender_top(base_date)
  output_first_week_spaces(month_days.first)
  output_days(month_days)
end

output_calendar(base_date, month_days)
