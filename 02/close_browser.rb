require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
sleep 2
puts 'browser will be closed'
dr.quit() # or dr.close()
puts 'browser is closed'
