require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome

dr.manage.window.resize_to(320,480)
dr.get 'http://www.3g.qq.com'

sleep 5
dr.quit

