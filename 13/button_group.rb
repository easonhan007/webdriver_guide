#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'button_group.html'))
dr.get file_path

# 定位text是second的按钮
second_btn = dr.find_element(:class, 'btn-group').find_elements(:class, 'btn').detect {|btn| btn.text == 'second'}
second_btn.click()
sleep(2)

dr.quit()

