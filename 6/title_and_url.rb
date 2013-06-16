require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
url = 'http://www.baidu.com'
puts "now access #{url}"
dr.get url

puts "title of current page is #{dr.title}"
puts "url of current page is #{dr.current_url}"
sleep 1

dr.quit
