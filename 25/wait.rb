#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'wait.html'))
dr.get file_path

# 点击按钮
dr.find_element(:id, 'btn').click()

wait = Selenium::WebDriver::Wait.new()
wait.until { dr.find_element(class: 'label').displayed? }

sleep(2)
dr.quit()

