#encoding: utf-8
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'level_locate.html'))

dr.get file_path

dr.find_element(:link_text, 'Link1').click
wait = Selenium::WebDriver::Wait.new({:timeout => 30})
wait.until { dr.find_element(:id, 'dropdown1').displayed? }
menu = dr.find_element(:id, 'dropdown1').find_element(:link_text, 'Another action')

dr.action.move_to(menu).perform()

sleep 2
dr.quit

