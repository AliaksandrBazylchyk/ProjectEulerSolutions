# frozen_string_literal: true

months = {
  'January' => 31,
  'February' => 28,
  'March' => 31,
  'April' => 30,
  'May' => 31,
  'June' => 30,
  'July' => 31,
  'August' => 31,
  'September' => 30,
  'October' => 31,
  'November' => 30,
  'December' => 31
}

day = 1
sunday_count = 0

(1900...2000).each do |year|
  months.each do |m|
    day += m[1].to_i
    day += 1 if (year % 4).zero? && (m[0] == 'February')
    sunday_count += 1 if (day % 7).zero?
  end
end

p sunday_count
