require 'watir-webdriver'

b = Watir::Browser.new :chrome
url = 'http://www.baidu.com'
puts "now access #{url}"
b.goto url

sleep 5

b.close
