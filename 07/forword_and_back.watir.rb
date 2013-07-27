require 'watir-webdriver'

b = Watir::Browser.new :chrome
first_url = 'http://www.baidu.com'
puts "now access #{first_url}"
b.goto(first_url)
sleep 1
second_url = 'http://www.news.baidu.com'
puts "now access #{second_url}"
b.goto(second_url)
sleep 1

puts "back to #{first_url}"
b.back()
sleep 1
puts "forward to #{second_url}"
b.forward()
sleep 1
b.close
