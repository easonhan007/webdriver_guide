#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'alert.html'))
dr.get file_path

# 点击链接弹出alert
dr.find_element(:id, 'tooltip').click()

alert = dr.switch_to.alert
alert.accept()

sleep(1)
dr.quit()

