require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
url = 'http://www.baidu.com'
puts "now access #{url}"
dr.get url
sleep 5

dr.quit
