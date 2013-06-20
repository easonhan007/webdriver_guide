#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'navs.html'))
dr.get file_path

# 方法1：层级定位，先定位ul再定位li
dr.find_element(:class, 'nav').find_element(:link_text, 'About').click()
sleep(1)

# 方法2: 直接定位link
dr.find_element(:link_text, 'Home').click()

dr.quit()

