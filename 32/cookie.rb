#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
url = 'http://www.baidu.com'
dr.get url

p dr.manage.all_cookies
dr.manage.delete_all_cookies
dr.manage.add_cookie(name: 'BAIDUID', value: 'xxxxxx')
dr.manage.add_cookie(name: 'BDUSS', value: 'xxxxxx')

dr.get url

sleep(3)
dr.quit()

