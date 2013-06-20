#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'operate_element.html'))

dr.get file_path
#click
dr.find_element(:link_text, 'Link1').click
sleep(1)
dr.find_element(:link_text, 'Link1').click

#send_keys
element = dr.find_element(:name, 'q')
element.send_keys('something')
sleep(1)

#clear
element.clear()

sleep(2)
dr.quit

