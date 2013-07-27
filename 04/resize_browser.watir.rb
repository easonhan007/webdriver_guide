require 'watir-webdriver'

b = Watir::Browser.new :chrome

b.window.resize_to(320, 480)
b.goto '3g.qq.com'

sleep 3
b.close
