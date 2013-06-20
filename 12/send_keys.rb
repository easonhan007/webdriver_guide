#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'send_keys.html'))
dr.get file_path

# copy content of A
dr.find_element(:id, 'A').send_keys([:control, 'a'])
dr.find_element(:id, 'A').send_keys([:control, 'x'])
sleep(1)

# paste to B
dr.find_element(:id, 'B').send_keys([:control, 'v'])
sleep(1)

# send keys to A
dr.find_element(:id, 'A').send_keys('watir', '-', 'webdriver', :space, 'is', :space, 'better')
sleep(2)

dr.quit()

