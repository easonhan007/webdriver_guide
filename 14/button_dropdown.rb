#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'button_dropdown.html'))
dr.get file_path

# 定位text是watir-webdriver的下拉菜单
# 首先显示下拉菜单
dr.find_element(:link_text, 'Info').click()
wait = Selenium::WebDriver::Wait.new(timeout: 10)
wait.until { dr.find_element(:class, 'dropdown-menu').displayed? }

# 通过ul再层级定位
dr.find_element(:class, 'dropdown-menu').find_element(:link_text, 'watir-webdriver').click()
sleep(1)

dr.quit()

