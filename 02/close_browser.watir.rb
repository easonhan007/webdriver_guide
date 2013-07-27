require 'watir-webdriver'

b = Watir::Browser.new :chrome
sleep 2
puts 'browser will be closed'
b.close 
puts 'browser is closed'
