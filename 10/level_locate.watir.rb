#encoding: utf-8
require 'watir-webdriver'

b = Watir::Browser.new :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'level_locate.html'))

b.goto file_path

b.link(:text, 'Link1').click

=begin
wait = Selenium::WebDriver::Wait.new({:timeout => 30})
wait.until { dr.find_element(:id, 'dropdown1').displayed? }
menu = dr.find_element(:id, 'dropdown1').find_element(:link_text, 'Another action')
dr.action.move_to(menu).perform()
=end


menu = b.ul(:id, 'dropdown1').when_present.link(:text, 'Another action')
menu.focus

sleep 2
b.close
