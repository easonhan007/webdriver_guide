#encoding: utf-8
require 'watir-webdriver'

b = Watir::Browser.new :chrome
file_path = 'file:///' + File.expand_path(File.join('.', 'alert.html'))

b.goto file_path

# 点击链接弹出alert
b.link(:id, 'tooltip').click()

alert = b.alert
alert.ok() # or use b.close() to cancel alert

sleep(1)
b.quit()

