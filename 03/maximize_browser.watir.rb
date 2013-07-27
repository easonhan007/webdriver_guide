require 'watir-webdriver'

b = Watir::Browser.new :chrome
sleep 2
puts 'maximize browser'
b.window.maximize
sleep 2
puts 'close browser'
b.close

