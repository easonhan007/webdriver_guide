require 'watir-webdriver'

b = Watir::Browser.new :chrome
url = 'http://www.baidu.com'
puts "now access #{url}"
b.goto url

puts "title of current page is #{b.title}"
puts "url of current page is #{b.url}"
sleep 1

b.close
